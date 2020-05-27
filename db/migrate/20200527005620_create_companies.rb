class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.string :website
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
