class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:user][:email])

    if @user && @user.authenticate(params[:user][:password])
      # success!!!!
      render json: {
            name: @user.name,
            email: @user.email,
            id: @user.id
          }
    else
      resp = {
        error: "Invalid credentials",
        details: @user.errors.full_messages
      }

      render json: resp, status: :unauthorized
    end
  end
end
