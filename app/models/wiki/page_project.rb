# == Schema Information
#
# Table name: wiki_page_projects
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  page_id    :integer          not null
#  project_id :integer          not null
#
# Indexes
#
#  index_wiki_page_projects_on_page_id     (page_id)
#  index_wiki_page_projects_on_project_id  (project_id)
#
module Wiki
  class PageProject < ApplicationRecord
    belongs_to :page
    belongs_to :project
  end
end
