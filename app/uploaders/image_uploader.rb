# frozen_string_literal: true

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # if Rails.env.production?
    storage :fog
  # else
  #   storage :file
  # end

  # S3のディレクトリ名
  def store_dir
    "relier-s3-production/#{model.id}"
  end

  # 許可する画像の拡張子
  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
