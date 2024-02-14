require "test_helper"

class LimitsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get limits_new_url
    assert_response :success
  end
end
