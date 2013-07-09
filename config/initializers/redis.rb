# -*- encoding : utf-8 -*-

class RedisWraper
  def initialize(*args)
    @redis = Redis.new(:host => APP_CONFIG["redis_host"] || "127.0.0.1", :port => APP_CONFIG["redis_port"] || 6379, :db => APP_CONFIG["redis_db"] || 0, :logger => Rails.logger)
  rescue Exception
    log_errors(e)
  end

  def method_missing(method, *args, &blk)
    if @redis.respond_to?(method)
        @redis.send method, *args, &blk
    else
      nil
    end
  rescue Exception => e
    log_errors(e)
    nil
  end

  def log_errors(e)
    Rails.logger.error "Redis error #{e}"
  end
end

$redis = RedisWraper.new

if defined?(PhusionPassenger)
  PhusionPassenger.on_event(:starting_worker_process) do |forked|
    if forked
      $redis.client.disconnect
      $redis = RedisWraper.new
    end
  end
end
