class SessionsController < ApplicationController
  # skip_before_action :authorized, only: :create
  #
  # def create
  #   @user = User.find_by(email: user_params[:email])
  #
  #   if @user &.authenticate(user_params[:password])
  #     token = encode_token({ user_id: @user.id })
  #     json_response 'Bem vindo!', true, { user: @user, token: token }, :ok
  #   else
  #     json_response 'Usuário ou senha inválidos!', false, {}, :unauthorized
  #   end
  # end
  #
  # private
  #
  # def user_params
  #   params.require(:user).permit(:email, :password)
  # end
end
