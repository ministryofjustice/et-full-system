module EtFullSystem
  module Test
    module CcdOfficeLookUp
      def office_lookup
        return Thread.current['ccd_office_lookup'] if Thread.current['ccd_office_lookup']

        systems = admin_api.external_systems(q: { reference_starts_with: 'ccd_' })
        Thread.current['ccd_office_lookup'] = systems.inject({}.with_indifferent_access) do |acc, system|
          key = system['reference'].gsub(/\Accd_/, '').to_sym
          office_code = system['office_codes'].first
          single_config = system['configurations'].detect { |c| c['key'] == 'case_type_id' }
          multiples_config = system['configurations'].detect { |c| c['key'] == 'multiples_case_type_id' }
          next acc if office_code.nil? || single_config.nil? || multiples_config.nil?

          acc[key] = {
              single: {
                  case_type_id: single_config['value'],
                  office_code: office_code
              },
              multiple: {
                  case_type_id: multiples_config['value'],
                  office_code: office_code
              }
          }
          acc
        end
      end
    end
  end
end
