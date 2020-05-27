class CreateFormTemplatesAndCompaniesApp < ActiveRecord::Migration[6.0]
  def change
    create_table :form_templates_apps do |t|
      add_column :tenants, :form_templates_app, :boolean
      add_column :tenants, :companies_app, :boolean
    end
  end
end
