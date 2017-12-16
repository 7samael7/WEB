Rails.application.routes.draw do
  get 'rooms/index'

  get 'rooms/show'

  get 'rooms/new'

  get 'rooms/create'

  get 'rooms/edit'

  get 'rooms/update'

  get 'rooms/destroy'

  get 'buildings/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'buildings#index'

  resources :buildings do
    resources :rooms
  end


end
