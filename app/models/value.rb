# == Schema Information
#
# Table name: values
#
#  id                    :bigint           not null, primary key
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
#  custom_fieldable_id   :bigint
#  field_id              :bigint
#
# Indexes
#
#  index_values_on_field_id  (field_id)
#
class Value < ApplicationRecord
  belongs_to :field
  belongs_to :custom_fieldable, polymorphic: true

  validates :type, presence: true, inclusion: { in: Field::TYPES }

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
