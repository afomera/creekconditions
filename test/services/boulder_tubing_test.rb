require('test_helper')

class BoulderTubingTest < ActiveSupport::TestCase
  test 'api endpoint returns expected params' do
    response = BoulderTubing.new.conditions

    assert response.is_a?(Hash)
    assert_format(response)
  end

  private

  def assert_format(response)
    assert response['temperature_f'].present?
    assert response['weather_condition'].present?
    assert response['flow_rate_cfs'].present?
  end
end
