class ApplicationController < ActionController::API
  include JsonResponse

  before_action :authenticate_and_set_user

  # before_action :authorized

  # def encode_token(payload)
  #   JWT.encode(payload, ENV['KEY'])
  # end
  #
  # def auth_header
  #   # { Authorization: 'Bearer <token>' }
  #   request.headers['Authorization']
  # end
  #
  # def decoded_token
  #   if auth_header
  #     # header: { 'Authorization': 'Bearer <token>' }
  #     begin
  #       JWT.decode(auth_header, ENV['KEY'], true, algorithm: 'HS256')
  #     rescue JWT::DecodeError
  #       nil
  #     end
  #   end
  # end
  #
  # def logged_in_user
  #   if decoded_token
  #     user_id = decoded_token[0]['user_id']
  #     @user = User.find_by(id: user_id)
  #   end
  # end
  #
  # def logged_in?
  #   !!logged_in_user
  # end
  #
  # def authorized
  #   render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  # end
end
