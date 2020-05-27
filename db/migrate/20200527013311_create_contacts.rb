class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.text :description
      t.string :website
      t.string :email
      t.string :phone

      t.integer :user_id, null: false
      t.integer :tenant_id, null: false
      t.integer :company_id

      t.timestamps
    end
  end
end
