# == Schema Information
#
# Table name: contacts
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  website     :string
#  email       :string
#  phone       :string
#  user_id     :integer          not null
#  tenant_id   :integer          not null
#  company_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
