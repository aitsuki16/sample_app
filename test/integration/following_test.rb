require "test_helper"

class FollowingTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    log_in_as(@user)
  end

  test "following page" do
    get following_user_path(@user)
    assert_response :success # The tutorial specifies :success.
    assert_not @user.following.empty? # Ensure the user is following someone.
    assert_match @user.following.count.to_s, response.body # Match the following count.
    @user.following.each do |user|
      assert_select "a[href=?]", user_path(user) # Confirm links to the followed users.
    end
  end

  test "followers page" do
    get followers_user_path(@user)
    assert_response :success # The tutorial specifies :success.
    assert_not @user.followers.empty? # Ensure the user has followers.
    assert_match @user.followers.count.to_s, response.body # Match the followers count.
    @user.followers.each do |user|
      assert_select "a[href=?]", user_path(user) # Confirm links to the followers.
    end
  end
end