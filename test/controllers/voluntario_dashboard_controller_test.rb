require "test_helper"

class VoluntarioDashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get voluntario_dashboard_index_url
    assert_response :success
  end
end
