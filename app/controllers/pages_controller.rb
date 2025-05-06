class PagesController < ApplicationController
   allow_unauthenticated_access only: %i[ home dashboard ]

  def home
    render json: { message: "Welcome to Dialectic Journal" }
  end

  def dashboard
    # @user = current_user
    # @conversations = currentuser.conversations
    # @tasks =
  end
end
