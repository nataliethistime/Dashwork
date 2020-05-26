class FixUnconfirmedEmailTypo < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :unconfirmed_emaild
    add_column :users, :unconfirmed_email, :string
  end
end
