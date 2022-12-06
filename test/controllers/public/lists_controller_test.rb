require "test_helper"

class Public::ListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_lists_index_url
    assert_response :success
  end

  test "should get new" do
    get public_lists_new_url
    assert_response :success
  end

  test "should get show" do
    get public_lists_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_lists_edit_url
    assert_response :success
  end
end
