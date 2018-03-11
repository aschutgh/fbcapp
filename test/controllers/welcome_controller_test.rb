require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest


  test "should get welcome index" do
    get welcome_index_url
    assert_response :success
    assert_select "title", "Fbcapp"
  end

end
