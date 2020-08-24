# == Schema Information
#
# Table name: assets
#
#  id             :bigint           not null, primary key
#  description    :text
#  manufacturer   :string
#  model          :string
#  name           :string
#  purchase_date  :date
#  purchase_price :decimal(, )
#  serial_number  :string
#  warranty_date  :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  tenant_id      :bigint
#
# Indexes
#
#  index_assets_on_tenant_id  (tenant_id)
#
require 'test_helper'

class AssetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
