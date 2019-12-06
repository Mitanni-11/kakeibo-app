class Form::IncomeForm < Form::Base
  attr_accessor :income_amounts

  def initialize(attributes = {})
    super attributes
    incomes = Income.order(created_at: :asc)
    self.income_amounts = incomes.map { |income| IncomeAmount.new(income_id: income.id) } unless income_amounts.present?
  end

  def income_values_attributes=(attributes)
    self.income_amounts = attributes.map do |_, income_value_attributes|
      Form::IncomeAmount.new(income_value_attributes).tap { |v| puts v}
    end

  end

  def valid?
    valid_income_amounts = self.income_amounts.map(&:valid?).all?
    super && valid_income_amounts
  end

  def save
    return false unless valid?
    IncomeAmount.transaction {
      self.income_amounts.select.each { |income_ammount|
        a1 = IncomeValue.new(:income_id => income_ammount.income_id,
                             :year_month => income_ammount.year_month,
                             :value => income_ammount.value,
                             :description => income_ammount.description)
        a1.save!
      }
    }
    true
  end

  def target_income_values
    self.income_amounts.select { |v| '*' }
  end

end