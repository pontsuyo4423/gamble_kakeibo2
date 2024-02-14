class CreateLimits < ActiveRecord::Migration[7.0]
  def change
    create_table :limits do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :goal, null:false
      t.timestamps
    end
  end
end
