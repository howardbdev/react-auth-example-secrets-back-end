class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:user][:email])

    if @user && @user.authenticate(params[:user][:password])
      # what goes here???
      session[:user_id] = @user.id
      resp = {
        user: @user.user_serializer
      }
      render json: resp, status: :ok
    else
      resp = {
        error: "Invalid credentials",
        details: @user.errors.full_messages
      }
      render json: resp, status: :unauthorized
    end
  end

  def get_current_user
    if logged_in?
      render json: {
          user: current_user.user_serializer
        }, status: :ok
    else
      render json: {error: "No current user"}
    end
  end

  def destroy
    if session.clear

      render json: {
        message: "Successfully logged out"
      }, status: :ok
    else
      render json: {
        error: "Something went wrong"
      }, status: 500
    end
  end
end
