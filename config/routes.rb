Rails.application.routes.draw do

  namespace :admin do
    get 'teachers/index'
  end

  namespace :admin do
    get 'teachers/show'
  end

  namespace :admin do
    get 'teachers/new'
  end

  namespace :admin do
    get 'teachers/edit'
  end

  namespace :admin do
    get 'students/index'
  end

  namespace :admin do
    get 'students/show'
  end

  namespace :admin do
    get 'students/new'
  end

  namespace :admin do
    get 'students/edit'
  end

  namespace :admin do
    get 'courses/index'
  end

  namespace :admin do
    get 'courses/show'
  end

  namespace :admin do
    get 'courses/new'
  end

  namespace :admin do
    get 'courses/edit'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'buildings#index'

  namespace :admin do
    resources :buildings do
      resources :rooms do
        resources :lessons
      end
    end
    get 'buildings/:id/overview', to: 'buildings#overview', as: 'overview_building'
  end

  resources :buildings do
    resources :rooms do
      resources :lessons
    end
  end

  get 'buildings/:id/overview', to: 'buildings#overview', as: 'overview_building'

end
