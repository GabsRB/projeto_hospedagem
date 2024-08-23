require "test_helper"

class AnfitriaoDashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get anfitriao_dashboard_index_url
    assert_response :success
  end
end
