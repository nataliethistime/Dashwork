# == Schema Information
#
# Table name: tenants
#
#  id                 :integer          not null, primary key
#  assets_app         :boolean          default(FALSE)
#  calendar_app       :boolean
#  companies_app      :boolean
#  contacts_app       :boolean
#  equipment_app      :boolean
#  form_templates_app :boolean
#  forms_app          :boolean
#  name               :string
#  notes_app          :boolean
#  personal_log_app   :boolean          default(FALSE)
#  projects_app       :boolean
#  reviews_app        :boolean          default(FALSE)
#  tasks_app          :boolean
#  timesheets_app     :boolean
#  wiki_app           :boolean          default(FALSE)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
require 'test_helper'

class TenantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
