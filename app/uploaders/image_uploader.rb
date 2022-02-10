class ImageUploader < CarrierWave::Uploader::Base
  # 保存先を本番環境のみS3に変更
  if Rails.env.production?
    storage :fog # 本番環境のみ
  else
    storage :file # 本番環境以外
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    'logo.png'
  end

  def extension_whitelist
    %w(jpg jpeg png)
  end
end
