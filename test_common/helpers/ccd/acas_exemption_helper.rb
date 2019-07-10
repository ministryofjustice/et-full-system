module EtFullSystem
  module Test
    module AcasExemptionHelper
      def acas_exemption(exemption)
        case exemption
        when 'Another person I’m making the claim with has an Acas early conciliation certificate number' then
          'Another person'
        when 'Acas doesn’t have the power to conciliate on some or all of my claim' then
          'No Power'
        when 'My employer has already been in touch with Acas' then
          'Employer already in touch'
        when 'The claim consists only of a complaint of unfair dismissal which contains an application for interim relief.' then
          'Unfair Dismissal'
        end
      end
    end
  end
end