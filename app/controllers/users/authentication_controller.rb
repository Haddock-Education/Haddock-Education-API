module Users
  class AuthenticationController < ApiGuard::AuthenticationController
    include JsonResponse

    before_action :find_resource, only: :create
    before_action :authenticate_resource, only: :destroy

    def create
      if resource.authenticate(user_params[:password])
        create_token_and_set_header(resource, resource_name)
        json_response 'Bem vindo!', true, { user: resource }, :ok
      else
        json_response 'Usuário ou senha inválidos.', false, {}, :unauthorized
      end
    end

    def destroy
      blacklist_token
      json_response 'Logout efetuado com sucesso.', true, {}, :ok
    end

    private

    def user_params
      params.require(:user).permit(:email, :password)
    end

    def find_resource
      self.resource = resource_class.find_by(email: user_params[:email].downcase.strip) if user_params[:email].present?
      json_response 'Usuário ou senha inválidos.', false, {}, :unauthorized unless resource
    end
  end
end
