# == Schema Information
#
# Table name: values
#
#  id               :bigint           not null, primary key
#  boolean_entity   :boolean
#  date_entity      :date
#  datetime_entity  :datetime
#  float_entity     :float
#  integer_entity   :integer
#  string_entity    :string
#  text_entity      :text
#  time_entity      :time
#  type             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  field_id         :bigint
#  linked_record_id :bigint
#
# Indexes
#
#  index_values_on_field_id  (field_id)
#
class Value < ApplicationRecord
  decorate_with ValueDecorator

  belongs_to :field

  TYPES = {
    'string' => 'StringValue'
  }

  validates :type, presence: true, inclusion: { in: TYPES.values }
  validates :linked_record_id, presence: true

  def self.type_for(type)
    TYPES[type]
  end

  def value
    raise "Please override #value: #{self.inspect}"
  end

  def value=(new_value)
    raise "Please override #value=: #{self.inspect}"
  end
end
