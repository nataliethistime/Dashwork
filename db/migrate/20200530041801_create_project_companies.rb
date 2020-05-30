class CreateProjectCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :project_companies do |t|
      t.belongs_to :project
      t.belongs_to :company
      t.belongs_to :tenant
      t.timestamps
    end
  end
end
