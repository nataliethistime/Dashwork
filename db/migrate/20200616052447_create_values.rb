class CreateValues < ActiveRecord::Migration[6.0]
  def change
    create_table :values do |t|
      t.string :string_entity
      t.date :date_entity
      t.time :time_entity
      t.datetime :datetime_entity
      t.text :text_entity
      t.integer :integer_entity
      t.float :float_entity
      t.boolean :boolean_entity

      t.belongs_to :field
      t.bigint :linked_record_id

      t.timestamps
    end

    drop_table :company_fields
    drop_table :string_values
  end
end
