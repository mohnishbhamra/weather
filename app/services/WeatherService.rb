class WeatherService

  attr_accessor :zipcode

  def initialize(zipcode)
    @zipcode = zipcode
  end

  def getWeather
    weather_data  = CacheUtil.read_or_execute(@zipcode, -> { WeatherClient.getWeather(@zipcode) })
    WeatherBlueprint.render_as_hash(weather_data, view: :summary)
  end

end