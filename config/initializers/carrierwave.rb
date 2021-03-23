CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAXMS6RKK74TRBACGD',
    aws_secret_access_key: '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',
    region: 'ap-northeast-1',
    }

  # 公開・非公開の切り替え
  config.fog_public     = true
  # キャッシュの保存期間
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }

  # キャッシュをS3に保存
  # config.cache_storage = :fog

  config.fog_directory = 'relier-s3-production'
  config.asset_host = 'https://s3.ap-northeast-1.amazonaws.com/relier-s3-production'
  config.cache_storage = :fog
end
  
# 日本語ファイル名の設定
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
