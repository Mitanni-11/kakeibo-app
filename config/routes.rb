Rails.application.routes.draw do
  root "top#index"
  resources :incomes
  resources :fixed_costs
end
