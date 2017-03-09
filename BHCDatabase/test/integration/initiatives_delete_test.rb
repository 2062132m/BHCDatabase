require 'test_helper'

class InitiativesDeleteTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
    log_in_as @admin
  end

  test 'delete initiative' do
    one = initiatives(:one)
    get initiative_url(one)
    assert_template 'initiatives/show'
    assert_difference 'Initiative.count', -1 do
      delete initiative_url(one)
    end
    assert_redirected_to initiatives_url
  end
end
