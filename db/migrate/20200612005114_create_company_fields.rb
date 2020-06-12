class CreateCompanyFields < ActiveRecord::Migration[6.0]
  def change
    create_table :company_fields do |t|
      t.belongs_to :company
      t.belongs_to :field
      t.timestamps
    end
  end
end
