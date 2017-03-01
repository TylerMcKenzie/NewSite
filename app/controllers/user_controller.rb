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
    @user = UserCreationService.new(user_params)
    if @user.save
      redirect_to '/'
    else
      @user.errors.full_messages
    end
    # p "=============PARAMS====================="
    # p user_params
    # p @user
    # # p "=============PROJECT_PARAMS============="
    # # p @user.projects << new(project_params)
    # p "======================================"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :about, :profile_image, { skills_attributes: [ :name, :proficiency ] }, { projects_attributes: [ :name, :url, :completed, { screenshots: :image } ] }, { contact_types_attributes: [:name, :url] })
  end
end
