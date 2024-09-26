require "test_helper"

class BallisticsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get ballistics_new_url
    assert_response :success
  end

  test "should get create" do
    get ballistics_create_url
    assert_response :success
  end
end
