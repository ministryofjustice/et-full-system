module EtFullSystem
  module Test
    module Et1Data
      include ::EtFullSystem::Test::I18n
      def json_object(json)
        hash = json[0].to_h
        hash.map do |key, value|
          value = t(value) if value.is_a?(Symbol)
          hash[key.to_sym] = value
        end
        return hash
      end
    end
  end
end