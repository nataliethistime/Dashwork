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
  belongs_to :field

  validates :type, presence: true, inclusion: { in: Field::TYPES }
  validates :linked_record_id, presence: true

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
