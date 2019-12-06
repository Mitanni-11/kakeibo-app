class FixedCost < ApplicationRecord
  has_many :fixed_cost_amounts, dependent: :destroy
end
