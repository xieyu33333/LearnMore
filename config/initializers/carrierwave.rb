::CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = "BuKxK1M6FdkaEJTdHpvGd1t-nMBTlPTowQXfa5x8"
  config.qiniu_secret_key    = 'ZEor0vwbH_IzEtXIewLHiVTJL--hE_NbtKxBTTF_'
  config.qiniu_bucket        = "text-learn"
  config.qiniu_bucket_domain = "text-learn.qiniudn.com"
  config.qiniu_protocal      = "http"
end