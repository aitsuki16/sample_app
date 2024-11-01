require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
   # loginpath here
    get login_path
    get sessions_new_url
    assert_response :success
  end
end
