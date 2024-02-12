# frozen_string_literal: true

require 'net/http'
require 'uri'

class WeatherClient

  def self.getWeather(zipcode)
    url= "https://api.openweathermap.org/data/2.5/weather?zip=#{zipcode},in&units=metric&appid=887e93b0cc42cccc633d36cd980e490c"
    url = URI.parse(url)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = (url.scheme == 'https')
    request = Net::HTTP::Get.new(url.request_uri)
    response = http.request(request)
    Rails.logger.debug("we got response from weather service - #{response.body}")
    if response.code == '200'
      JSON.parse(response.body)
    else
      nil
    end
  end
end
