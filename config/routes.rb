Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcomes#index"
  resources :books do
   resources :madlibs
  end
  resource :session, only: [:create, :destroy, :show]
  resources :users
  resources :wordforms
end
