class WeatherController < ApplicationController
  before_action :validate_params
  def show
    puts params[:zipcode]
    @weather  = WeatherService.new(params[:zipcode]).getWeather
    render 'weather/show'
  end

  def validate_params
    params.permit("zipcode")
  end

end
