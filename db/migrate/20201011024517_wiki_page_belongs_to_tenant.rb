class WikiPageBelongsToTenant < ActiveRecord::Migration[6.0]
  def change
    change_table :wiki_pages do |t|
      t.belongs_to :tenant
    end

    Wiki::Page.all.each do |page|
      page.tenant = page.folder.tenant
      page.save!
    end
  end
end
