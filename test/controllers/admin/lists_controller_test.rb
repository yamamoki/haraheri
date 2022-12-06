require "test_helper"

class Admin::ListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_lists_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_lists_show_url
    assert_response :success
  end
end
