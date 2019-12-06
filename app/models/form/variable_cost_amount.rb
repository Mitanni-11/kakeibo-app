class Form::VariableCostAmount < VariableCostAmount
  REGISTRABLE_ATTRIBUTES = %i(variable_cost_id year_month value description)
  attr_accessor :variable_cost_id
  attr_accessor :year_month
  attr_accessor :value
  attr_accessor :description
end