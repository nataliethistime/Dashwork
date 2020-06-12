# == Schema Information
#
# Table name: string_values
#
#  id         :bigint           not null, primary key
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  field_id   :integer
#
class StringValue < ApplicationRecord
  belongs_to :field
end
