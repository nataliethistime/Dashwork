class AddPreferredTheme < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :preferred_theme, :string
  end
end
