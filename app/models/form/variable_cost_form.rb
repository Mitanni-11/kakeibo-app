class Form::VariableCostForm < Form::Base
  attr_accessor :variable_cost_amounts

  def initialize(attributes = {})
    super attributes

    variable_costs = VariableCost.order(created_at: :asc)
    self.variable_cost_amounts = variable_costs.map { |variable_cost| VariableCostAmount.new(variable_cost_id: variable_cost.id) } unless variable_cost_amounts.present?
  end

  def variable_cost_amounts_attributes=(attributes)
    self.variable_cost_amounts = attributes.map do |_, variable_cost_amount_attributes|
      Form::VariableCostAmount.new(variable_cost_amount_attributes).tap { |v| puts v}
    end

  end

  def valid?
    valid_variable_cost_amounts = self.variable_cost_amounts.map(&:valid?).all?
    super && valid_variable_cost_amounts
  end

  def save
    return false unless valid?
    VariableCostAmount.transaction {
      self.variable_cost_amounts.select.each { |variable_cost_value|
        a1 = VariableCostAmount.new(:variable_cost_id => variable_cost_value.variable_cost_id,
                                   :year_month => variable_cost_value.year_month,
                                   :value => variable_cost_value.value,
                                   :description => variable_cost_value.description)
        a1.save!
      }
    }
    true
  end

  def target_variable_cost_amounts
    self.variable_cost_amounts.select { |v| '*' }
  end

end