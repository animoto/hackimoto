HackimotoApp::Application.routes.draw do
  resources :hackimotos do
    resources :hacks
    resources :categories do
      resources :prizes
    end
  end
end
