Rails.application.routes.draw do
  root "top#index"
  resources :incomes
  resources :fixed_costs
  resources :variable_costs
  resources :income_amounts
end
