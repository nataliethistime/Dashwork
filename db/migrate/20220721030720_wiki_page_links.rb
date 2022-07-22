class WikiPageLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :wiki_page_companies do |t|
      t.belongs_to :page, null: false
      t.belongs_to :company, null: false
      t.timestamps null: false
    end

    create_table :wiki_page_contacts do |t|
      t.belongs_to :page, null: false
      t.belongs_to :contact, null: false
      t.timestamps null: false
    end

    create_table :wiki_page_projects do |t|
      t.belongs_to :page, null: false
      t.belongs_to :project, null: false
      t.timestamps null: false
    end

    change_table :notes do |t|
      t.belongs_to :wiki_page, null: true
    end
  end
end
