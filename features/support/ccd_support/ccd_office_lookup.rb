module EtFullSystem
  module Test
    module CcdOfficeLookUp
      def office_lookup
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
