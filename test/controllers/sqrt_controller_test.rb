require "test_helper"

class SqrtControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get sqrt_input_url
    assert_response :success
  end

  test "should get view" do
    get sqrt_view_url
    assert_response :success
  end
end
