Rails.application.routes.draw do
  root 'events#index'
  resources :events, only: [:index, :new, :create, :show]
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :attendances, only: [:new, :index, :create]
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/checkout' do
    post 'create/:id', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end

end