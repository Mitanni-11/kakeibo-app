Rails.application.routes.draw do
  root "top#index"
  post "income_amounts/new(/:name)" => "income_amounts#new"
  post "fixed_cost_amounts/new(/:name)" => "fixed_cost_amounts#new"
  resources :incomes
  resources :fixed_costs
  resources :variable_costs
  resources :income_amounts
  resources :fixed_cost_amounts
end
