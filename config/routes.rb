Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'buildings#index'

  namespace :admin do
    root to: 'dashboard#index'
    resources :buildings do
      resources :rooms do
        resources :lessons
      end
    end
    resources :students
    resources :teachers
    resources :courses
    get 'buildings/:id/overview', to: 'buildings#overview', as: 'overview_building'
    get 'lessons', to: 'lessons#all', as: 'all_lessons'
    get 'rooms', to: 'rooms#all', as: 'all_rooms'
  end

  resources :buildings do
    resources :rooms do
      resources :lessons
    end
  end

  get 'buildings/:id/overview', to: 'buildings#overview', as: 'overview_building'

end
