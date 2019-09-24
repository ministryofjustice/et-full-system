require 'rspec/matchers'
require 'mechanize'
module EtFullSystem
  module Test
    class AdminApi
      include ::RSpec::Matchers
      include ::EtFullSystem::Test::I18n

      # @param [::EtFullSystem::Test::AtosInterface] atos_interface
      def initialize(atos_interface:)
        self.atos_interface = atos_interface
      end

      def url
        Configuration.admin_url
      end

      def get_token
        response = request(:get, url)
        self.csrf_token = response.body.match(/csrf-token" content="([^"]*)"/)[1]
      end

      def mechanize_login
        return if mechanize_logged_in?
        page = agent.get(url)
        page.form.field_with(name: 'admin_user[username]').value = ::EtFullSystem::Test::Configuration.admin_username
        page.form.field_with(name: 'admin_user[password]').value = ::EtFullSystem::Test::Configuration.admin_password
        result = agent.submit(page.form)
        raise "Login failed" if result.search(XPath.generate {|x| x.descendant[x.string.n.contains("Signed in successfully")]}.to_s).empty?
      end

      def login
        return if logged_in?
        get_token
        resp = request(:post, "#{url}/login",
          headers: {
            'Content-Type' => 'application/x-www-form-urlencoded'
          },
          cookies: cookies_hash,
          body: {
            admin_user: {
              username: ::EtFullSystem::Test::Configuration.admin_username,
              password: ::EtFullSystem::Test::Configuration.admin_password,
              remember_me: '0'
            },
            authenticity_token: csrf_token
          })
        raise "An error occured trying to login" unless resp.success?

        self.logged_in = true
      end

      def claims
        login
        claims = request(:get, "#{url}/claims.json", cookies: cookies_hash)
        JSON.parse(claims.body).map(&:with_indifferent_access)
      end

      def find_latest_claim
        claims.last
      end

      def respondents_api
        login
        claimants = request(:get, "#{url}/respondents.json", cookies: cookies_hash)
        JSON.parse(claimants.body).map(&:with_indifferent_access)
      end

      def claimants_api
        login
        claimants = request(:get, "#{url}/claimants.json", cookies: cookies_hash)
        JSON.parse(claimants.body).map(&:with_indifferent_access)
      end

      def acas_certificate_logs_api
        login
        acas_logs = request(:get, "#{url}/download_logs.json", cookies: cookies_hash)
        JSON.parse(acas_logs.body).map(&:with_indifferent_access)
      end

      def external_systems(query = {})
        login
        external_systems = request(:get, "#{url}/external_systems.json?#{query.to_query}", cookies: cookies_hash)
        JSON.parse(external_systems.body).map(&:with_indifferent_access)
      end

      def responses(query = {})
        login
        responses = request(:get, "#{url}/responses.json?#{query.to_query}", cookies: cookies_hash)
        JSON.parse(responses.body).map(&:with_indifferent_access)
      end

      def processed_response(reference, timeout: 30, sleep: 0.5)
        login
        Timeout.timeout(timeout) do
          loop do
            responses = responses q: {reference_equals: reference}
            return responses.first if responses.first[:uploaded_files].any? {|f| f['filename'] =~ /\Aet3_.*\.pdf\z/}
            sleep(sleep)
          end
        end
      rescue Timeout::Error
        raise "The response with reference #{reference} was either not found or never had all of its files"
      end

      def admin_diversity_data
        login
        response = request(:get, "#{url}/diversity_responses.json?
          claim_type_contains=data[:claim_type]
          &sex_contains=data[:sex_contains] 
          &sexual_identity_contains=data[:sexual_identity]
          &age_group_contains=data[:age_group]
          &ethnicity_contains=data[:ethnicity]
          &ethnicity_subgroup_contains=data[:ethnicity_subgroup]
          &disability_contains=data[:disability]
          &caring_responsibility_contains=data[:caring_responsibility]
          &gender_contains=data[:gender]
          &gender_at_birth_contains=data[:gender_at_birth]
          &pregnancy_contains=data[:pregnancy]
          &relationship_contains=data[:relationship]
          &religion_contains=data[:religion]", cookies: cookies_hash)
        data = response[0].delete_if { |k, v| %w"id created_at updated_at".include? k}
        return data.inject({}) do |a, (k,v)|
          if v.nil? 
            a[k] = nil
          elsif v == "Jehovah's Witnesses"
            a[k] = v
          else
            a[k] = t("#{k}.#{v}")
          end
          a
        end
      end

      def export_response_to_ccd(external_system_id:, response_reference:)
        response = processed_response(response_reference)
        mechanize_login
        #  {"utf8"=>"✓", "authenticity_token"=>"r5OI+QKjssqdg7YkdFI2pHxVTD+xi82wGjaLQQA0/J7O7OC6gBi7gzoywY08yV9rXBO3kFR0yloBMY1ALjPXyg==", "batch_action"=>"export", "batch_action_inputs"=>"{\"external_system_id\":\"17\"}", "collection_selection_toggle_all"=>"on", "collection_selection"=>["1"], "q"=>{"reference_equals"=>"242000000200"}}
        p = agent.current_page
        # <meta name="csrf-token" content="ytwP931nOlzYVWOENBNJHKk8J3uL6iZElQ4Pr9lz++nZOdQuDsBUQjkCNh8ZWdE5cJxcAGyql11WANN
        token = p.search('meta[name=csrf-token]').first['content']

        result = agent.post "#{url}/responses/batch_action",
                   {
                       batch_action: 'export',
                       batch_action_inputs: {external_system_id: external_system_id}.to_json,
                       collection_selection: [response[:id].to_s],
                       authenticity_token: token
                   }.to_json,
                  'Content-Type' => 'application/json',
                  'Accept' => 'text/html'
        raise "export_response_to_ccd failed" if result.search(XPath.generate {|x| x.descendant[x.string.n.contains("Responses queued for export")]}.to_s).empty?
      end


      def run_export_cron_job
        setup_for_export_cron_job
        resp = request(:post, sidekiq_cron_form_url, body: {authenticity_token: sidekiq_authenticity_token, enque: 'Enqueue Now'}, cookies: cookies_hash)
        raise "An error occured trying to run the export cron job" unless resp.success?
      end

      def atos_zip_file_for_claim(claim_application_reference:, timeout: 30, sleep: 0.5)
        claim = find_claim(claim_application_reference: claim_application_reference, timeout: timeout)
        atos_zip_file_for(reference: claim['reference'], sleep: sleep, timeout: timeout)
      end

      def atos_zip_file_for(reference:, timeout: 30, sleep: 0.5)
        Timeout.timeout(timeout) do
          loop do
            run_export_cron_job
            zip_file = atos_interface.zip_file_for_reference(reference)
            break zip_file unless zip_file.nil?
            sleep(sleep)
          end
        end
      rescue Timeout::Error
        raise "An ATOS zip file for reference #{reference} was not found"
      end

      def get_reference_number(claim_application_reference:, timeout: 30, sleep: 0.5)
        login
        Timeout.timeout(timeout) do
          loop do
            response = request(:get, "#{url}/claims.json?q[submission_reference_equals]=#{claim_application_reference}", cookies: cookies_hash)
            claims = JSON.parse(response.body)
            return claims[0]['reference'] unless claims.empty?
            sleep(sleep)
          end
        end
      rescue Timeout::Error
        raise "The claim with application_reference #{claim_application_reference} was not stored in the API"
      end

      def find_claim(claim_application_reference:, timeout: 30, sleep: 0.5)
        login
        Timeout.timeout(timeout) do
          loop do
            response = request(:get, "#{url}/claims.json?q[submission_reference_equals]=#{claim_application_reference}", cookies: cookies_hash)
            claims = JSON.parse(response.body)
            break claims[0] unless claims.empty?
            sleep(sleep)
          end
        end
      rescue Timeout::Error
        raise "The claim with application_reference #{claim_application_reference} was not stored in the API"

      end

      private

      def logged_in?
        logged_in
      end

      def mechanize_logged_in?
        mechanize_logged_in
      end


      def setup_for_export_cron_job
        return if sidekiq_cron_form_url.present?

        login
        sidekiq_cron_url = "#{url}/sidekiq/cron"
        response = request(:get, sidekiq_cron_url, cookies: cookies_hash)
        doc = Nokogiri::HTML response.body
        form_xpath = XPath.generate { |x| x.descendant(:form)[x.child(:input)[x.attr(:value).contains('Enqueue Now')]] }
        form = doc.xpath(form_xpath.to_s)
        self.sidekiq_authenticity_token = form.css('input[name=authenticity_token]')[0][:value]
        self.sidekiq_cron_form_url = URI.parse(sidekiq_cron_url).tap {|u| u.path = form[0][:action] }.to_s

      end

      def request(method, url, options = {})
        proxy = EtFullSystem::Test::Configuration['proxy']
        options = options.merge(verify: false)
        if proxy
          proxy_uri = URI.parse("http://#{proxy}")
          options[:http_proxyaddr] = proxy_uri.host
          options[:http_proxyport] = proxy_uri.port
          options[:http_proxyuser] = proxy_uri.user
          options[:http_proxypass] = proxy_uri.password
        end
        self.last_response = HTTParty.send(method, url, options)
        self.cookies_hash = HTTParty::CookieHash.new
        cookies_hash.add_cookies(last_response.headers['set-cookie'])
        last_response
      end

      def agent
        @agent ||= Mechanize.new
      end
      
      attr_accessor :cookies_hash, :last_response, :csrf_token, :sidekiq_authenticity_token, :sidekiq_cron_form_url, :atos_interface, :logged_in, :mechanize_logged_in
    end
  end
end
