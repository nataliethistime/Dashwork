class CreateCompanyCompanyGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :company_company_groups do |t|
      t.belongs_to :company
      t.belongs_to :company_group
      t.timestamps
    end
  end
end
