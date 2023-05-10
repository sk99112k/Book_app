require "test_helper"

class TopicControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get topic_show_url
    assert_response :success
  end

  test "should get index" do
    get topic_index_url
    assert_response :success
  end

  test "should get edit" do
    get topic_edit_url
    assert_response :success
  end
end
