# Report
#
# This class acts as a wrapper around the BoulderTubing class, to return if it's
# a good day for tubing or not inside of an OpenStruct.
class Report
  attr_reader(:params)

  VALID_WEATHER_CONDITIONS = [
    'windy', 'cloudy', 'mostly cloudy',
    'partly cloudy', 'clear', 'sunny', 'fair', 'hot'
  ].freeze

  def initialize(params)
    @params = params
  end

  def conditions
    OpenStruct.new(
      temperature_f: params['temperature_f'],
      weather_condition: params['weather_condition'],
      flow_rate_cfs: params['flow_rate_cfs'],
      good_day: good_day_for_tubing?
    )
  end

  private

  def good_day_for_tubing?
    valid_temperature? && valid_weather? && valid_flow_rate?
  end

  # To be a good day, the weather needs to be in certain conditions
  def valid_weather?
    VALID_WEATHER_CONDITIONS.include?(params['weather_condition'].downcase)
  end

  # To be a good day for tubing it needs to be above 85 F.
  def valid_temperature?
    params['temperature_f'].to_i > 85
  end

  # Flow rate needs to be between 40 and 300
  def valid_flow_rate?
    params['flow_rate_cfs'].to_i.between?(40, 300)
  end
end
