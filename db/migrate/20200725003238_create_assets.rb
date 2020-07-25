class CreateAssets < ActiveRecord::Migration[6.0]
  def change
    create_table :assets do |t|
      t.string :name
      t.text :description
      t.string :model
      t.string :manufacturer
      t.string :serial_number
      t.date :waranty_date
      t.date :purchase_date
      t.decimal :purchase_price
      t.timestamps
    end
  end
end
