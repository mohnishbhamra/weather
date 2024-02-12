class WeatherController < ApplicationController
  before_action :sanitize_params, only: :show
  before_action :validate_params, only: :show

  def show
    puts params[:zipcode]
    @weather = WeatherService.new(params[:zipcode]).getWeather
    if (@weather.dig(:error).present?)
      show_errors(@weather.dig(:error))
    else
      render 'weather/show'
    end

  end

  def sanitize_params
    params.permit("zipcode")
  end

  def validate_params
    weather_validator = WeatherApiValidator.new(params)
    show_errors(weather_validator.errors.to_json) unless weather_validator.valid?
  end

  def show_errors(error_message)
    @error_message = error_message
    render 'weather/error'
  end

end
