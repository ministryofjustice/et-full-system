require 'ostruct'
module EtFullSystem
  module Test
    module Setup
      attr_accessor :user

      def given_i_am(user_name)
        return self.user = OpenStruct.new if user_name.to_sym == :anonymous
        self.user = personas.fetch(user_name)
      end
    end
  end
end
