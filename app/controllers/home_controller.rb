class HomeController < ApplicationController
  def index
    render json: { message: "Welcome to Dialectic Journal" }
  end
end
