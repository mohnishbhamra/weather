class WeatherService

  attr_accessor :zipcode

  def initialize(zipcode)
    @zipcode = zipcode
  end

  def getWeather
    WeatherClient.getWeather(@zipcode)
  end

end