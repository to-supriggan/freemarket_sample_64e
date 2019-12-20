require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  # 環境によって保存先を変更
  if Rails.env.production?
    # 本番環境
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'freemarket_sample_64e'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
      aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
      region: 'ap-northeast-1'
    }
  else
    # その他環境
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
end
