class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:user][:email])

    if @user && @user.authenticate(params[:user][:password])
      # if success!!!!
      # generate a JWT
      # "beans" should be EVN['SECRET']
      token = generate_token({id: @user.id})
      # include that token in the response back to the client
      # include the user in the reponse as well

      resp = {
        user: user_serializer(@user),
        jwt: token
      }

      render json: resp
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
          user: user_serializer(current_user)
        }, status: :ok
    else
      render json: {error: "No current user"}
    end
  end
end
