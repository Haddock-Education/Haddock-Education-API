class Api::V1::UsersController < ApplicationController
  def show
    user = User.find_by(id: params[:id])

    if user
      json_response 'Detalhes do usuário', true, { user: user }, :ok
    else
      json_response 'Usuário não encontrado', false, {}, :not_found
    end
  end
end
