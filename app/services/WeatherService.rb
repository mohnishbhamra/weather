class WeatherService

  attr_accessor :zipcode

  def initialize(zipcode)
    @zipcode = zipcode
  end

  def getWeather
    CacheUtil.read_or_execute(@zipcode, -> { WeatherClient.getWeather(@zipcode) })
  end

end