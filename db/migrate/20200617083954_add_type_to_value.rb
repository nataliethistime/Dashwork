class AddTypeToValue < ActiveRecord::Migration[6.0]
  def change
    add_column :values, :type, :string
  end
end
