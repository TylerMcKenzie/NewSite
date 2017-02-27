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

end
