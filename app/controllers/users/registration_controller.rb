module Users
  class RegistrationController < ApiGuard::RegistrationController
    include JsonResponse

    before_action :authenticate_resource, only: :destroy

    def create
      init_resource(sign_up_params)
      if resource.save
        create_token_and_set_header(resource, resource_name)

        token = response.header.select do |key, value|
          ['Access-Token', 'Refresh-Token', 'Expire-At'].include?(key)
        end

        json_response 'Cadastro realizado com sucesso!', true, { user: resource, token: token }, :ok
      else
        json_response 'Algo deu errado', false, {}, :unprocessable_entity
      end
    end

    # def destroy
    #   current_resource.destroy
    #   json_response 'Usuário excluído!', true, {}, :ok
    # end

    private

    def sign_up_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :role_id)
    end
  end
end
