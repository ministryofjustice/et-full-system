module EtFullSystem
  module Test
    module AdminPages
      def self.dashboard_page
        Admin::DashboardPage.new
      end

      def self.login_page
        Admin::LoginPage.new
      end

      def self.jobs_page
        Admin::JobsPage.new
      end

      def self.job_sidekiq_cron_page
        Admin::JobSidekiqCronPage.new
      end

      def self.atos_files_page
        Admin::AtosFilesPage.new
      end
    end
  end
end