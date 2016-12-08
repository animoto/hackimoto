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

  get '/add_judge_form/:hackimoto_id', controller: :hackimotos, action: :add_judge_form, as: :add_judge_form
  get '/add_admin_form/:hackimoto_id', controller: :hackimotos, action: :add_admin_form, as: :add_admin_form
  patch '/add_judge/:hackimoto_id', controller: :hackimotos, action: :add_judge, as: :add_judge
  patch '/add_admin/:hackimoto_id', controller: :hackimotos, action: :add_admin, as: :add_admin
  delete '/remove_judge/:hackimoto_id/:user_id', controller: :hackimotos, action: :remove_judge, as: :remove_judge
  delete '/remove_admin/:hackimoto_id/:user_id', controller: :hackimotos, action: :remove_admin, as: :remove_admin
end
