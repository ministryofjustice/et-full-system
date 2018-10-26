require_relative 'test_common/configuration'
require_relative 'test_common/atos_interface.rb'
require 'aws-sdk-s3'
desc 'Configures the buckets needed by the applications (local environment only)'
task :setup_buckets do
  config = {
      region: ENV.fetch('AWS_REGION', 'us-east-1'),
      access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID', 'accessKey1'),
      secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY', 'verySecretKey1'),
      endpoint: ENV.fetch('AWS_ENDPOINT', 'http://s3.et.127.0.0.1.nip.io:3100/'),
      force_path_style: ENV.fetch('AWS_S3_FORCE_PATH_STYLE', 'true') == 'true'
  }
  s3 = Aws::S3::Client.new(config)
  Aws::S3::Bucket.new(client: s3, name: 'et1bucket').tap do |bucket|
    bucket.create unless bucket.exists?
  end
  Aws::S3::Bucket.new(client: s3, name: 'etapibucket').tap do |bucket|
    bucket.create unless bucket.exists?
  end
end
task :delete_zip_files_from_server do
  ::EtFullSystem::Test::AtosInterface.instance.delete_zip_files
end
