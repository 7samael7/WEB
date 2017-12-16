Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'buildings#index'

  resources :buildings do
    resources :rooms do
      resources :courses
    end
  end


end
