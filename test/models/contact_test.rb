# == Schema Information
#
# Table name: contacts
#
#  id             :integer          not null, primary key
#  address        :string
#  birthday       :date
#  description    :text
#  email          :string
#  first_name     :string
#  home_phone     :string
#  job_department :string
#  job_title      :string
#  last_name      :string
#  mobile_phone   :string
#  nickname       :string
#  title          :string
#  website        :string
#  work_phone     :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  company_id     :integer
#  tenant_id      :integer          not null
#  user_id        :integer          not null
#
require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
