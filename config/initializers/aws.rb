# s3 = AWS.config({
#   :access_key_id => ENV['ACCESS_KEY'],
#   :secret_access_key => ENV['SECRET_KEY']
# })

s3 = AWS::S3.new(:access_key_id => ENV['ACCESS_KEY'], :secret_access_key => ENV['SECRET_KEY'])

S3_BUCKET = s3.buckets[ENV['S3_BUCKET']]

