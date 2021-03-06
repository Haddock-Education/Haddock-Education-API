Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  api_guard_routes for: 'users', controller: {
    registration: 'users/registration',
    authentication: 'users/authentication',
    passwords: 'users/passwords',
    tokens: 'users/tokens'
  }

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, except: :delete do
        get :questions, to: 'questions#index_own'
      end
      resources :questions do
        resources :answers, except: :index
      end

      get '/rankings', to: 'rankings#top_three'
      get '/my_ranking', to: 'rankings#my_ranking'
    end
  end

  get '/documentations', to: 'documentations#show'
end
