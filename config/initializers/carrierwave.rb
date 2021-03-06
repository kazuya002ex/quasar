require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['S3_ACCESS_KEY'],
    aws_secret_access_key: ENV['S3_SECRET_KEY'],
    region: 'ap-northeast-1',
    }

  # 公開・非公開の切り替え
  config.fog_public     = true
  # キャッシュの保存期間
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }

  config.fog_directory = 'relier-s3-production'
  config.asset_host = "https://s3.ap-northeast-1.amazonaws.com/relier-s3-production"
  # キャッシュをS3に保存
  config.cache_storage = :fog
end
  
# 日本語ファイル名の設定
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
