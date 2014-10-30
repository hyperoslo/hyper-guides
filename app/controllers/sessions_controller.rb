class SessionsController < ApplicationController
  include AngularBootstrapper

  respond_to :html, :json

  def create
    user = AdminUser.find_by email: params[:username]

    if user.try :authenticate, params[:password]
      session[:user_id] = user.id
      head :ok
    else
      head :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    head :ok
  end
end
