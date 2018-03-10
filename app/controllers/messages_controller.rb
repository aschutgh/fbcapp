class MessagesController < ApplicationController

  def new
    @user = User.find(current_user.id)
  end

  def index
    @user = User.find(current_user.id)
    @messages = Message.where("user_id IN (?) OR user_id = ?", @user.friends.ids, @user.id).paginate(:page => params[:page], :per_page => 2)
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
