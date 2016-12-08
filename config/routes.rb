HackimotoApp::Application.routes.draw do
  root :to => "hackimotos#index"

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :hackimotos do
    resources :hacks
    resources :categories, except: [:index, :show] do
      resources :prizes, except: [:index, :show]
    end
  end

  post '/register_to_hackimoto', controller: :users, action: :register_to_hackimoto, as: :register_to_hackimoto
  get '/register_to_hack', controller: :users, action: :register_to_hack, as: :register_to_hack
end
