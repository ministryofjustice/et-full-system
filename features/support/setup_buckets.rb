require 'aws-sdk-s3'

if ENV['ENVIRONMENT'] == 'local'
  config = {region: ENV.fetch('AWS_REGION', 'us-east-1')}
  config[:endpoint] = EtFullSystem::Test::Configuration.aws_endpoint_url
  config[:force_path_style] = ENV.fetch('AWS_S3_FORCE_PATH_STYLE') == 'true' if ENV.key?('AWS_S3_FORCE_PATH_STYLE')
  s3 = Aws::S3::Client.new(config)
    Aws::S3::Bucket.new(client: s3, name: 'et1bucket').tap do |bucket|
      bucket.create unless bucket.exists?
  end
  Aws::S3::Bucket.new(client: s3, name: 'etapibucket').tap do |bucket|
    bucket.create unless bucket.exists?
  end
end
 