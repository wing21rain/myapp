require "test_helper"

class ChestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chests_index_url
    assert_response :success
  end

  test "should get open" do
    get chests_open_url
    assert_response :success
  end
end
