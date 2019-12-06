class Form::FixedCostAmount < FixedCostAmount
  REGISTRABLE_ATTRIBUTES = %i(fixed_cost_id year_month value description)
  attr_accessor :fixed_cost_id
  attr_accessor :year_month
  attr_accessor :value
  attr_accessor :description
end