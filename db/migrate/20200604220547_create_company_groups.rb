class CreateCompanyGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :company_groups do |t|
      t.string :name, null: false
      t.belongs_to :tenant
      t.timestamps
    end
  end
end
