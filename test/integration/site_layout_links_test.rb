# test/integration/site_layout_links_test.rb
require "test_helper"

class SiteLayoutLinksTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "layout links for non-logged-in user" do
    # Visit the root path
    get root_path
    assert_template 'static_pages/home'

    # Check that the links are present
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", signup_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path

    # Ensure logged-in links aren't present
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", edit_user_path(@user), count: 0
  end

  test "layout links for logged-in user" do
    # Log in as the user
    log_in_as(@user)

    # Visit the root path again
    get root_path
    assert_template 'static_pages/home'

    # Check that the logged-in links are now present
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", edit_user_path(@user)
    assert_select "a[href=?]", user_path(@user)
  end
end