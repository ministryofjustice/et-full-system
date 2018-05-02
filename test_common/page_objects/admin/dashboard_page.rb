module EtFullSystem
  module Test
    module Admin
      class DashboardPage < Admin::BasePage
        set_url ""
        element :csrf_meta, :css, 'meta[name=csrf-token]'

        def csrf_token
          csrf_meta[:content]
        end
      end
    end
  end
end