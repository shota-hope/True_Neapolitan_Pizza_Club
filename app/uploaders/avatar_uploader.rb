class AvatarUploader < CarrierWave::Uploader::Base

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
