require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @tester = User.new(:email => "example1@example.com", :fullname => "Testgebruiker1",
              :password => "testabc123", :password_confirmation => "testabc123")
    @testerpts = User.new(:email => "example1@example.com", :fullname => "Testgebruiker1",
                 :password => "t123", :password_confirmation => "t123")
  end

  test "assert save of valid user tester" do
    assert @tester.save
  end

  test "assert password too short" do
    assert_not @testerpts.save
  end

  test "require unique email address" do
    dupuser = @tester.dup
    @tester.save
    assert_not dupuser.valid?
  end

  test "assert fullname not too long" do
    @tester.fullname = "a" * 26
    assert_not @tester.save
  end

  

end
