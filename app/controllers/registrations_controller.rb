class RegistrationsController < ApplicationController
  # skip_before_action :authorized, only: :create
  #
  # def create
  #   @user = User.create(user_params)
  #   if @user.valid?
  #     token = encode_token({user_id: @user.id})
  #     json_response 'Registro efetuado com sucesso!', true, { user: @user, token: token }, :ok
  #   else
  #     json_response 'Algo deu errado!', false, {}, :unprocessable_entity
  #   end
  # end
  #
  # private
  #
  # def user_params
  #   params.require(:user).permit(:name, :email, :password, :password_confirmation)
  # end
end
