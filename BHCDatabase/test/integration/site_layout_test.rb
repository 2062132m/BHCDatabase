require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:admin)
    @volunteer = users(:volunteer)
    @service_user = users(:service_user)
  end

  test "layout links when logged out" do
    get root_path
    follow_redirect!
    assert_template 'sessions/new'
    assert_select "a[href=?]", login_path,       count: 0
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
    assert_select "a[href=?]", users_path,       count:0
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

  test "layout links when logged in as admin" do
    log_in_as(@user)
    get root_path
    assert_template 'homepage/index'
    assert_select "a[href=?]", root_path, count: 3
    get new_user_path
    assert_select "title", full_title("New User")
  end

  test "layout links when logged in as volunteer" do
    log_in_as(@volunteer)
    get root_path
    follow_redirect!
    assert_template 'volunteers_homepage/index'
    assert_select "a[href=?]", root_path,       count: 3
    assert_select "a[href=?]", logout_path,      count: 1
    assert_select "a[href=?]", users_path,      count: 0
    assert_select "a[href=?]", areas_path,      count: 0
    assert_select "a[href=?]", initiatives_path,      count: 0
  end

  test "layout links when logged in as user" do
    log_in_as(@service_user)
    get root_path
    follow_redirect!
    assert_template 'service_users_homepage/index'
    assert_select "a[href=?]", root_path,       count: 3
    assert_select "a[href=?]", logout_path,      count: 1
    assert_select "a[href=?]", users_path,      count: 0
    assert_select "a[href=?]", areas_path,      count: 0
    assert_select "a[href=?]", initiatives_path,      count: 0
  end
end
