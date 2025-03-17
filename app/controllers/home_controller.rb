class HomeController < ApplicationController
  allow_unauthenticated_access only: %i[ index ]

  def index
    render json: { message: "Welcome to Dialectic Journal" }
  end
end
