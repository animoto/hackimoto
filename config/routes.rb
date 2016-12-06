HackimotoApp::Application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :hackimotos do
    resources :hacks
    resources :categories, except: [:index, :show] do
      resources :prizes, except: [:index, :show]
    end
  end
end
