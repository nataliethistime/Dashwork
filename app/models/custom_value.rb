# == Schema Information
#
# Table name: custom_values
#
#  id                    :integer          not null, primary key
#  boolean_entity        :boolean
#  custom_fieldable_type :string
#  date_entity           :date
#  datetime_entity       :datetime
#  float_entity          :float
#  integer_entity        :integer
#  string_entity         :string
#  text_entity           :text
#  time_entity           :time
#  type                  :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  custom_field_id       :bigint
#  custom_fieldable_id   :bigint
#
# Indexes
#
#  index_custom_values_on_custom_field_id  (custom_field_id)
#
class CustomValue < ApplicationRecord
  belongs_to :custom_field
  belongs_to :custom_fieldable, polymorphic: true

  validates :type, presence: true, inclusion: { in: CustomField::TYPES }

  def value
    raise "Please override #value: #{self.inspect}"
  end

  def value=(*)
    raise "Please override #value=: #{self.inspect}"
  end

  def form_field_type
    raise "Please override #form_field_type: #{self.inspect}"
  end
end
