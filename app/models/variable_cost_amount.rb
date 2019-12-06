class VariableCostAmount < ApplicationRecord
  has_many :variable_cost_amounts, dependent: :destroy
end
