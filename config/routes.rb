Rails.application.routes.draw do
  get 'variable_cost_amounts/index'
  get 'variable_cost_amounts/show'
  get 'variable_cost_amounts/new'
  get 'variable_cost_amounts/edit'
  root "top#index"
  post "income_amounts/new(/:name)" => "income_amounts#new"
  post "fixed_cost_amounts/new(/:name)" => "fixed_cost_amounts#new"
  post "variable_cost_amounts/new(/:name)" => "variable_cost_amounts#new"
  resources :incomes
  resources :fixed_costs
  resources :variable_costs
  resources :income_amounts
  resources :fixed_cost_amounts
  resources :variable_cost_amounts
end
