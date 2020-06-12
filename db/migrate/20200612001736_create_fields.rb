class CreateFields < ActiveRecord::Migration[6.0]
  def change
    create_table :fields do |t|
      t.string :name
      t.string :type
      t.string :domain
      t.belongs_to :tenant
      t.timestamps
    end
  end
end
