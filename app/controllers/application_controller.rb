class ApplicationController < ActionController::API
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :bad_request
  rescue_from StandardError, with: :internal_server_error
  
  private

  def authenticate_user!
    header = request.headers['Authorization']
    token = header.split(' ').last if header #strips Bearer

    payload = JsonWebToken.decode(token)
    @current_user = User.find(payload['user_id'])
  rescue => e
    render json: { error: "Unauthorized" }, status: :unauthorized
  end

  def current_user
    @current_user
  end

  def render_success(message:, data: nil, status: :ok)
    render json: { message: message, data: data }, status: status
  end

  def render_error(message:, errors: [], status: :unprocessable_entity)
    render json: { message: message, errors: errors }, status: status
  end

  def not_found(exception)
    render_error(message: exception.message, status: :not_found)
  end

  def bad_request(exception)
    render_error(message: exception.message, status: :bad_request)
  end

  def internal_server_error(exception)
    render_error(message: exception.message, status: :internal_server_error)
  end
end
