class Users::SessionsController < Devise::SessionsController
  include RackSessionFix
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: {
      status: { code: 200, message: 'Logged in sucessfully.' },
      data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
    }, status: :ok
  end

  def respond_to_on_destroy
    if request.headers['Authorization'].present?
      begin
        jwt_payload = JWT.decode(request.headers['Authorization'].split.last,
                                 ENV.fetch('devise_jwt_secret_key', nil)).first
        current_user = User.find(jwt_payload['sub'])
      rescue JWT::ExpiredSignature
        render json: { status: 401, message: 'Token has expired.' }, status: :unauthorized
        return
      rescue JWT::DecodeError
        render json: { status: 401, message: 'Token is invalid.' }, status: :unauthorized
        return
      end
    end

    if current_user
      render json: {
        status: 200,
        message: 'Logged out successfully.'
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end
end
