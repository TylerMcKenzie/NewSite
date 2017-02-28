class UserController < ApplicationController

  def index
    @user = User.first

    if @user
      render 'index'
    else
      redirect_to new_user_url
    end
  end

  def new
    @user = User.new
  end

  def create
    p params
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :about)
  end
end
