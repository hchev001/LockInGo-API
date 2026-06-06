
class Api::V1::AuthController < ApplicationController
  skip_before_action :authenticate_user!, only: [:login, :register]

  # @summary Login to the application
  # @tags Auth
  # @request_body Login credentials [!Inputs::LoginInput]
  # @response Successful login [200] [Outputs::AuthResponse]
  # @response Invalid credentials [401] [Outputs::ErrorResponse]
  def login
    user = User.find_by(email: params[:username])

    if user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      render_success(message: "Login successful", data: { user: user, token: token })
    else
      render_error(message: "Invalid username or password", status: :unauthorized)
    end

  end

  # @summary Register a new user
  # @tags Auth
  # @request_body User registration details [!Inputs::RegisterInput]
  # @response Successful registration [201] [Outputs::MessageResponse]
  # @response Validation failed [422] [Outputs::ErrorResponse]
  def register
    user = User.new(user_params)

    if user.save
      render_success(message: "Registration successful", status: :created)
    else
      render_error(message: "Registration failed", errors: user.errors.full_messages)
    end
  end

  private # <-- everything below this line is private
  # filter to only allow the required parameters for user registration
  def user_params
    params.require(:user).permit(:email, :name, :password)
  end
end