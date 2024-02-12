# frozen_string_literal: true

class WeatherBlueprint < Blueprinter::Base
  view :summary do
    field :name, name: :city
    field :cached
    field :current_temp do |data|
      data.dig(:main, :temp)
    end
    field :min_temp do |data|
      data.dig(:main, :temp_min)
    end
    field :max_temp do |data|
      data.dig(:main, :temp_max)
    end
    field :error
  end
end
