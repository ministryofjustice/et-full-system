require 'active_support/core_ext/hash'
module EtFullSystem
  module Test
    class PersonasRepository
      PERSONAS_FILE = File.absolute_path('../fixtures/personas.yml', __FILE__)
      def initialize
        self.registry = {}
      end

      # Fetch a persona
      # @param [String] name The name of the persona to fetch
      # @return [Hash] The hash stored in the persona
      def fetch(name)
        ensure_loaded
        convert_value registry.fetch(name)
      end

      private

      def convert_value(obj)
        case obj
        when Hash
           obj.with_indifferent_access
        when Array
          obj.map {|v| convert_value(v)}
        else
          obj
        end
      end


      def ensure_loaded
        load unless loaded?
      end

      def loaded?
        loaded
      end

      def load
        self.registry = YAML.load_file(PERSONAS_FILE).symbolize_keys
        self.loaded = true
      end

      attr_accessor :registry, :loaded
    end
  end
end
