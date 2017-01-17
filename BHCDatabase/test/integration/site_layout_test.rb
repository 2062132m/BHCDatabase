require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:david)
  end

  test "layout links when logged out" do
    get root_path
    follow_redirect!
    assert_template 'sessions/new'
    assert_select "a[href=?]", login_path,       count: 0
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
    assert_select "a[href=?]", root_url,         count: 0
    assert_select "a[href=?]", contact_path,     count: 1
    get contact_path
    assert_template 'static_pages/contact'
    assert_select "title", full_title("Contact")
    assert_select "a[href=?]", login_path,       count: 1
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
    assert_select "a[href=?]", root_url,         count: 0

  end

  test "layout links when logged in" do
    log_in_as(@user)
    get root_path
    assert_template 'homepage/index'
    assert_select "a[href=?]", root_path, count: 3
    get signup_path
    assert_select "title", full_title("Sign up")
  end
end
