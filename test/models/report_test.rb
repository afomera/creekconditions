require('test_helper')

class ReportTest < ActiveSupport::TestCase
  setup do
    @params = JSON.parse(
      {
        "temperature_f": "88",
        "weather_condition": "Partly Cloudy",
        "flow_rate_cfs": 94.5
      }.to_json
    )
  end

  test 'valid_weather? returns true when valid' do
    Report::VALID_WEATHER_CONDITIONS.each do |condition|
      @params["weather_condition"] = condition
      report = Report.new(@params)

      assert report.send('valid_weather?')
    end
  end

  test 'valid_flow_rate? returns true when within 40 to 300' do
    report = Report.new(@params)
    assert report.send('valid_flow_rate?')
  end

  test 'valid_flow_rate? returns false when not within 40 to 300' do
    @params["flow_rate_cfs"] = "39"
    report = Report.new(@params)
    assert_not report.send('valid_flow_rate?')

    @params["flow_rate_cfs"] = "301"
    report = Report.new(@params)
    assert_not report.send('valid_flow_rate?')
  end

  test 'valid_temperature? returns true when over 85' do
    report = Report.new(@params)
    assert report.send('valid_temperature?')
  end

  test 'valid_temperature? returns false when under 85' do
    @params["temperature_f"] = "60"
    report = Report.new(@params)
    assert_not report.send('valid_temperature?')
  end
end
