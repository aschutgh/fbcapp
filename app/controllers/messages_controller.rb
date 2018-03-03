class MessagesController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @messages = @user.messages.all
  end

  def create
    @user = User.find(current_user.id)
    @message = @user.messages.create(message_params)
    redirect_to user_path(@user)
  end

  private
    def message_params
      params.require(:message).permit(:content)
    end
end
