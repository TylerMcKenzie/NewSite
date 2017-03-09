class UserController < ApplicationController
  load_and_authorize_resource
  
  def show
    @user = User.first

    if @user
      render 'show'
    else
      redirect_to new_user_registration_path
    end
  end

end
