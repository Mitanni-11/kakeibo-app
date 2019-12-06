class CreateIncomeAmounts < ActiveRecord::Migration[6.0]
  def change
    create_table :income_amounts do |t|
      t.integer :income_id, null: false
      t.date :year_month
      t.integer :value
      t.string :description
      t.timestamps
    end
  end
end
