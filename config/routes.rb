Rails.application.routes.draw do
  get 'properties/index'
  devise_for :users
  devise_scope :user do
    root to: "properties#index"
  end
  resources :properties
end
