class CreateStringValues < ActiveRecord::Migration[6.0]
  def change
    create_table :string_values do |t|
      t.integer :field_id
      t.string :value
      t.timestamps
    end
  end
end
