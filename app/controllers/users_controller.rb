class UsersController < ApplicationController
before_action :authenticate_user!

  def index
    @users = User.paginate(:page => params[:page], :per_page => 2)
  end

  def show
    @user = User.find(current_user.id)
  end

end
