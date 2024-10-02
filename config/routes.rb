Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
    root to: "properties#index"
  end
  resources :properties do 
    resources :incomes
    resources :expenses
    get 'financials/year/:year', to: 'financials#yearly', as: 'yearly_financials', on: :member
  end
  
end
