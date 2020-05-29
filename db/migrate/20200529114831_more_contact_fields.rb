class MoreContactFields < ActiveRecord::Migration[6.0]
  def change
    remove_column :contacts, :name
    remove_column :contacts, :phone
    add_column :contacts, :first_name, :string
    add_column :contacts, :last_name, :string
    add_column :contacts, :nickname, :string
    add_column :contacts, :title, :string
    add_column :contacts, :job_title, :string
    add_column :contacts, :job_department, :string
    add_column :contacts, :home_phone, :string
    add_column :contacts, :work_phone, :string
    add_column :contacts, :mobile_phone, :string
    add_column :contacts, :address, :string
    add_column :contacts, :birthday, :date
  end
end
