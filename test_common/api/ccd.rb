require 'rspec/matchers'
module EtFullSystem
  module Test
    class CcdApi
      include ::RSpec::Matchers
      include ::EtFullSystem::Test::I18n

      def initialize
        self.cookies_hash = HTTParty::CookieHash.new
      end

      def url
        Configuration.ccd_client_url
      end

      def get_cookies
        response = request(:get, url)
        self.csrf_token = response.body.match(/_csrf" value="([^"]*)"/)[1]
      end

      def login
        return if logged_in?
        get_cookies
        resp = request(:post, url,
          headers: {
            'Content-Type' => 'application/x-www-form-urlencoded'
          },
          cookies: cookies_hash,
          body: {
            username: 'm@m.com',
            password: 'p',
            continue: 'http://localhost:3451/oauth2redirect',
            upliftToken: '',
            response_type: 'code',
            _csrf: csrf_token,
            redirect_uri: 'http://localhost:3451/oauth2redirect',
            client_id: 'ccd_gateway',
            scope: '',
            state: ''
          })
        raise "An error occured trying to login" unless resp.success?
        self.logged_in = true
      end

      private

      def logged_in?
        logged_in
      end

      def request(method, url, options = {})
        self.last_response = HTTParty.send(method, url, options.merge(verify: false))
        if last_response.headers.key? "set-cookie"
          cookies_hash.add_cookies(last_response.headers['set-cookie'])
        end
        last_response
      end
      
      attr_accessor :cookies_hash, :last_response, :csrf_token, :logged_in
    end
  end
end