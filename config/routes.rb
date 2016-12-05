HackimotoApp::Application.routes.draw do
  resources :hackimotos do
    resources :hacks
    resources :categories, except: [:index, :show] do
      resources :prizes, except: [:index, :show]
    end
  end
end
