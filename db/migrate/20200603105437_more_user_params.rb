class MoreUserParams < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :language, :string
    add_column :users, :timezone, :string
    add_column :users, :country, :string
  end
end
