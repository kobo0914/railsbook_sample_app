require "test_helper"

class GoodmorningControllerTest < ActionDispatch::IntegrationTest
  test "should get world" do
    get goodmorning_world_url
    assert_response :success
  end
end
