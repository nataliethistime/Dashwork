# == Schema Information
#
# Table name: project_companies
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint
#  project_id :bigint
#
# Indexes
#
#  index_project_companies_on_company_id  (company_id)
#  index_project_companies_on_project_id  (project_id)
#
class ProjectCompany < ApplicationRecord
  belongs_to :project
  belongs_to :company
end
