# frozen_string_literal: true

class WeatherApiValidator
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks
  attr_accessor :zipcode

  def initialize(options = {})
    options.keys.each do |key|
      instance_variable_set("@#{key.to_s}",options[key])
    end
  end

  validates :zipcode, presence: true
  validate :zipcode_value

  def zipcode_value
    return if zipcode.blank?
    errors.add(:zipcode, message: "zipcode is not of length 6") if zipcode.length != 6
    errors.add(:zipcode, message: "zipcode is not positive non zero integer") if zipcode.to_i.eql?(0)
  end
end
