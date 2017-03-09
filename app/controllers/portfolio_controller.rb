class PortfolioController < ApplicationController
  load_and_authorize_resource

  def new
    @portfolio = Portfolio.new
  end

  def create
    portfolio = UserPortfolioCreationService.new(current_user.id, portfolio_params).save

    if portfolio.errors.empty?
      redirect_to user_portfolio_path(current_user.id, portfolio.id)
    else
      @errors = portfolio.errors.full_messages
    end
  end

  def edit
    #code
  end

  def update
    #code
  end

  def show
    @portfolio = Portfolio.find(params[:id])
    p "==================="
    if @portfolio
      render 'show'
    else
      redirect_to '/'
    end
  end

  protected

  def portfolio_params
    params.require(:portfolio).permit(:name, :email, :about, :profile_image, { skills_attributes: [ :name, :proficiency ] }, { projects_attributes: [ :name, :url, :completed, { screenshots: :image } ] }, { contact_types_attributes: [:name, :url] })
  end

end
