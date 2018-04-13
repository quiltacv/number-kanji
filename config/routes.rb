Rails.application.routes.draw do
  root 'home#index'
  get 'home/index', to: 'home#index'
  post 'home/test', to: 'home#test'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
