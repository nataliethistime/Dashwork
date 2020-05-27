class FixCompanyReferences < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :company_id, :integer
    add_column :tasks, :company_id, :integer
  end
end
