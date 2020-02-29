Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'widgets#index'

  resources :authentication, only: %i[create] do
    post :revoke, on: :collection
    post :refresh, on: :collection
  end

  resources :users, except: %i[new edit destroy] do
    get :me
    post :change_password
    get :check_email
    post :reset_password
  end

  resources :widgets, except: %i[new edit] do
    scope :visible do
      get :index, on: :collection
      get :search, on: :collection
    end
  end
end