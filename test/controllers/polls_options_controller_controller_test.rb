require 'test_helper'

class PollsOptionsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get polls_options_controller_add_url
    assert_response :success
  end

  test "should get delete" do
    get polls_options_controller_delete_url
    assert_response :success
  end

  test "should get edit" do
    get polls_options_controller_edit_url
    assert_response :success
  end

end
