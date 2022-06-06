require "test_helper"

class Public::PostSushisControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_post_sushis_new_url
    assert_response :success
  end

  test "should get index" do
    get public_post_sushis_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_post_sushis_edit_url
    assert_response :success
  end

  test "should get show" do
    get public_post_sushis_show_url
    assert_response :success
  end
end
