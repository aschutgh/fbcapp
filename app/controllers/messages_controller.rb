class MessagesController < ApplicationController

  def new
    @user = User.find(current_user.id)
  end

  def index
    @user = User.find(current_user.id)
    @messages = @user.messages.all
  end

  def create
    @user = User.find(current_user.id)
    @message = @user.messages.create(message_params)
    redirect_to root_url
  end

  private
    def message_params
      params.require(:message).permit(:content)
    end
end
