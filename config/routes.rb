Rails.application.routes.draw do
  root 'events#index'
  namespace :admins do
    resources :events, only: %i[index show edit update destroy]
    resources :users
  end
  resources :admins, only: [:index]
  resources :events, only: %i[index new create show] do
    resources :attendances, only: %i[new index create]
    resources :event_pictures, only: [:create]
  end
  devise_for :users
  resources :users, only: %i[show edit update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/checkout' do
    post 'create/:id', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end
end
