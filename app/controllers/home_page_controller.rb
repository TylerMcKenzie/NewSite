class HomePageController < ApplicationController
  def index
    @user = User.first
  end
end
