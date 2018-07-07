# BoulderTubing
#
# This class returns data from an API that returns the conditions for the creek.
# API Endpoint: https://boulder-tubing-api.herokuapp.com/conditions
# Example Response:
#
# {
#    "temperature_f": "88",
#    "weather_condition": "Partly Cloudy",
#    "flow_rate_cfs": 95.5
#  }
class BoulderTubing
  include HTTParty

  # No-op here, in the future, if the API expands we could pass params to be
  # used in other api calls.
  def initialize; end

  def conditions
    HTTParty.get(endpoint).parsed_response
  end

  private

  def endpoint
    "https://boulder-tubing-api.herokuapp.com/conditions"
  end
end
