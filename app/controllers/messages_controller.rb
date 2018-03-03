class MessagesController < ApplicationController

  def create
    @user = User.find(current_user.id)
    @comment = @user.messages.create(message_params)
    redirect_to user_path(@user)
  end

  private
    def message_params
      params.require(:message).permit(:content)
    end
end
