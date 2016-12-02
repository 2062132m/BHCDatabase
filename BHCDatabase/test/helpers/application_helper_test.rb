require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title, "Building Healthy Communities"
    assert_equal full_title("Contact"), "Contact | Building Healthy Communities"
  end
end