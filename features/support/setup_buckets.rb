require 'aws-sdk-s3'
config = {region: ENV.fetch('AWS_REGION', 'us-east-1')}
config[:endpoint] = ENV.fetch('AWS_ENDPOINT') if ENV.key?('AWS_ENDPOINT')
config[:force_path_style] = ENV.fetch('AWS_S3_FORCE_PATH_STYLE') == 'true' if ENV.key?('AWS_S3_FORCE_PATH_STYLE')
s3 = Aws::S3::Resource.new(config)
my_bucket = s3.bucket('et1bucket')
my_bucket.create
my_bucket = s3.bucket('etapibucket')
my_bucket.create
