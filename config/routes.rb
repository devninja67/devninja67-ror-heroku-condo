Rails.application.routes.draw do
  resources :communities
  devise_for :users
  root to: 'homes#inicio'
  get 'welcomes/inicio'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
