# == Schema Information
#
# Table name: wiki_page_companies
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :integer          not null
#  page_id    :integer          not null
#
# Indexes
#
#  index_wiki_page_companies_on_company_id  (company_id)
#  index_wiki_page_companies_on_page_id     (page_id)
#
module Wiki
  class PageCompany < ApplicationRecord
    belongs_to :page
    belongs_to :company
  end
end
