Rails.application.routes.draw do
  get 'buildings/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'buildings#index'
  resources :buildings

end
