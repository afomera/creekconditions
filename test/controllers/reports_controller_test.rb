require('test_helper')

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test 'index actions returns 200' do
    get root_url
    assert response.status.eql?(200)
  end
end
