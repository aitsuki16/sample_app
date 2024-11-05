require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "friendly forwarding only on first login" do
    # First login should forward to intended page
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_path(@user)
    assert_nil session[:forwarding_url]

    # Log out and log in again, should redirect to default (profile page)
    delete logout_path
    log_in_as(@user)
    assert_redirected_to @user
  end


  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)

  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    name  = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), params: { user: { name:  name,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name,  @user.name
    assert_equal email, @user.email

  end
end




#   test "should redirect edit when logged in as wrong user" do
#     log_in_as(@user)  # Log in as `@user`
#     get edit_user_path(@other_user)  # Try to access another user's edit page
#     assert_redirected_to root_url  # Check that it redirects to the root URL
#   end

#   test "should redirect update when logged in as wrong user" do
#     log_in_as(@user)  # Log in as `@user`
#     patch user_path(@other_user), params: { user: { name: @other_user.name,
#                                                     email: @other_user.email } }
#     assert_redirected_to root_url  # Check that it redirects to the root URL
#   end
# end
