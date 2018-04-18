require 'ostruct'
module EtFullSystem
  module Test
    module Setup
      attr_accessor :user

      def given_i_am(user_name, unique: false)
        return self.user = {} if user_name.to_sym == :anonymous
        self.user = personas.fetch(user_name)
        if unique
          now = Time.now
          seconds_since_midnight = now.to_f - now.midnight.to_f
          id = "#{now.strftime('%y%j')}#{seconds_since_midnight.round(3)}"
          user[:personal][:first_name] = "#{user[:personal][:first_name]}#{id}"
        end
      end
    end
  end
end
