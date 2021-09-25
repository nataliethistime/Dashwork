class RemoveTenants < ActiveRecord::Migration[6.0]
  def change
    #
    # Tags
    #
    change_table(:tags) { |t| t.belongs_to :user }
    Tag.all.each { |tag| tag.update!(user_id: tag.tenant.users.first.id) }

    #
    # Custom fields
    #
    change_table(:custom_fields) { |t| t.belongs_to :user }
    CustomField.all.each { |field| field.update!(user_id: field.tenant.users.first.id) }

    #
    # Wiki folders and pages
    #
    change_table(:wiki_folders) { |t| t.belongs_to :user }
    change_table(:wiki_pages) { |t| t.belongs_to :user }
    Wiki::Folder.all.each { |folder| folder.update!(user_id: folder.tenant.users.first.id) }
    Wiki::Page.all.each { |page| page.update!(user_id: page.tenant.users.first.id) }
  end
end
