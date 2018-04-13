Then(/^my entered data is formatted into a PDF format file and is available for ATOS to download$/) do
  within_admin_window do
    admin_pages.atos_files_page.load
    file_count_before = admin_pages.atos_files_page.file_count
    admin_pages.jobs_page.run_export_claims_cron_job
    get_page_count = -> {
      admin_pages.atos_files_page.load
      admin_pages.atos_files_page.file_count
    }
    expect(&get_page_count).to eventually(be > file_count_before)
  end
end