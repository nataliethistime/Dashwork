class FixCompanyField < ActiveRecord::Migration[6.0]
  def change
    add_reference :company_fields, :tenant, foreign_key: true
  end
end
