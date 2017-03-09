class PortfolioController < ApplicationController
  load_and_authorize_resource
  def new
    @portfolio = Portfolio.new
  end
end
