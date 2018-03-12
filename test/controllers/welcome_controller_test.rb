require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @tester = users(:tester)
  end
  

  test "should get welcome index" do
    get welcome_index_url
    assert_response :success
    assert_select "title", "Fbcapp"
  end

  test "assert login link exists when not logged in" do
    get welcome_index_url
    assert_select "a[href=?]", new_user_session_path
  end

  test "sign in user tester" do
    sign_in @tester
    get root_url
    assert_response :success
    assert_select "a[href=?]", users_path
  end

  test "assert redirect when accessing users_path when not authenticated" do
    get users_path
    assert_response :redirect
    follow_redirect!
    assert_select "h2", "Log in"
  end

  test "assert successful logout" do
    sign_in @tester
    get root_url
    sign_out @tester
    get root_url
    assert_select "a[href=?]", new_user_session_path
  end

end
