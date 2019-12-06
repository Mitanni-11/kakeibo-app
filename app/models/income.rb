class Income < ApplicationRecord
  has_many :income_amounts, dependent: :destroy
end
