module EtFullSystem
  module Test
    module CcdOfficeLookUp
      def office_lookup
        puts "WARNING - DEPRECATION - Please switch to using settings.ccd_case_type_ids instead of office_lookup - called by #{caller.first}"
        {
          "single":
          {
            41 => "Glasgow_Dev",
            24 => "Manchester_Dev"
          },
          "multiple":
          {
            41 => "Glasgow_Multiples_Dev",
            24 => "Manchester_Multiples_Dev" 
          }
        }
      end
    end
  end
end
