require 'httparty'

module EtFullSystem
  module Test
    class DeleteZipFilesApi

      def delete_atos_api
        HTTParty.post(::EtFullSystem::Test::Configuration.atos_api_url/v1/filetransfer/delete)
      end

      def list_zip_filenames
        response = HTTParty.get("#{base_url}/v1/filetransfer/list", basic_auth: { username: username, password: password })
        response.body.lines.map(&:strip)
      end
    end
  end
end