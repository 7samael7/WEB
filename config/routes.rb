Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'buildings#index'

  namespace :admin do
    resources :buildings do
      resources :rooms do
        resources :lessons
      end
    end
  end

  resources :buildings do
    resources :rooms do
      resources :lessons
    end
  end

  get 'buildings/:id/overview', to: 'buildings#overview', as: 'overview_building'

end
