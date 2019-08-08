module EtFullSystem
  module Test
    module CcdFileHelper
      def download_file(response, file_type)
        document = response['case_fields']['documentCollection'].find do |document|
          document['value']['uploadedDocument']['document_filename'].end_with?(".#{file_type}")
        end

        url = document['value']['uploadedDocument']['document_binary_url']

        tempfile = Tempfile.new
        File.open(tempfile, 'wb')  do |f|
          block = proc { |response|
            response.read_body do |chunk|
              f.write chunk
            end
          }
          RestClient::Request.new(method: :get, url: url, block_response: block).execute
        end
        tempfile
      end
    end
  end
end