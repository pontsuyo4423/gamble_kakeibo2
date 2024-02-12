class CreateIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :incomes do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :price, null: false
      t.integer :category_id, null: false
      t.date :date, null: false
      t.timestamps
    end
  end
end
