# frozen_string_literal: true

class CacheUtil
  def self.read_or_execute(key, lambda_method)
    cached = true
    cached_data = Rails.cache.fetch(key, expires_in: 30.minutes)
    if (cached_data.blank?)
      cached_data = lambda_method.call
      Rails.cache.write(key, cached_data, expires_in: 30.minutes)
      cached = false
    end
    cached_data.merge(cached: cached)
  end

end
