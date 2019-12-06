class Form::FixedCostForm < Form::Base
  attr_accessor :fixed_cost_amounts

  def initialize(attributes = {})
    super attributes

    fixed_costs = FixedCost.order(created_at: :asc)
    self.fixed_cost_amounts = fixed_costs.map { |fixed_cost| FixedCostAmount.new(fixed_cost_id: fixed_cost.id) } unless fixed_cost_amounts.present?
  end

  def fixed_cost_amounts_attributes=(attributes)
    self.fixed_cost_amounts = attributes.map do |_, fixed_cost_value_attributes|
      Form::FixedCostAmount.new(fixed_cost_value_attributes).tap { |v| puts v}
    end

  end

  def valid?
    valid_fixed_cost_amounts = self.fixed_cost_amounts.map(&:valid?).all?
    super && valid_fixed_cost_amounts
  end

  def save
    return false unless valid?
    FixedCostAmount.transaction {
      self.fixed_cost_amounts.select.each { |fixed_cost_amount|
        a1 = FixedCostAmount.new(:fixed_cost_id => fixed_cost_amount.fixed_cost_id,
                                :year_month => fixed_cost_amount.year_month,
                                :value => fixed_cost_amount.value,
                                :description => fixed_cost_amount.description)
        a1.save!
      }
    }
    true
  end

  def target_fixed_cost_amount
    self.fixed_cost_amounts.select { |v| '*' }
  end

end