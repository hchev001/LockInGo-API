
class Api::V1::AuthController < ApplicationController
  skip_before_action :authenticate_user!, only: [:login, :register]

  def login
    # get username and password from params

    user = User.find_by(email: params[:username])

    if user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      render json: { message: "Login successful", user: user, token: token }, status: :ok
    else
      render json: { message: "Invalid username or password" }, status: :unauthorized
    end 

  end

  def register
    # use the payload email, name, and password to create a new user
    user = User.new(user_params)

    if user.save
      render json: { message: "Registration successful" }, status: :created
    else
      render json: { message: "Registration failed", errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private # <-- everything below this line is private
  # filter to only allow the required parameters for user registration
  def user_params
    params.require(:user).permit(:email, :name, :password)
  end
end
