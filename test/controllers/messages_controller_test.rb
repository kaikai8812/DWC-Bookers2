require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get crete" do
    get messages_crete_url
    assert_response :success
  end

end
