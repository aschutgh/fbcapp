require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:tester)
    @message = @user.messages.build(content: "Test message")
  end

  test "message should have a user_id" do
    @message.user_id = nil
    assert_not @message.save
  end

end
