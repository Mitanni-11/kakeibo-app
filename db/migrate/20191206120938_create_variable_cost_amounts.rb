class CreateVariableCostAmounts < ActiveRecord::Migration[6.0]
  def change
    create_table :variable_cost_amounts do |t|
      t.integer :variable_cost_id, null: false
      t.date :year_month
      t.integer :value
      t.string :description
      t.timestamps
    end
  end
end
