# == Schema Information
#
# Table name: contacts
#
#  id             :bigint           not null, primary key
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
class Contact < ApplicationRecord
  decorate_with ContactDecorator

  belongs_to :tenant
  belongs_to :user
  belongs_to :company, -> (contact) { where(tenant_id: contact.tenant_id) }, optional: true
  has_many :notes, -> (contact) { where(tenant_id: contact.tenant_id) }
  has_many :forms, -> (contact) { where(tenant_id: contact.tenant_id) }
  has_many :notes, -> (contact) { where(tenant_id: contact.tenant_id) }
  has_many :tasks, -> (contact) { where(tenant_id: contact.tenant_id) }
  # TODO: link events
  # TODO: link projects

  def self.titles
    %w[Mr Mrs Ms Dr Prof Sir]
  end

  validates :title, inclusion: { in: self.titles }, allow_blank: true

  default_scope -> { order(:first_name) }

  #
  # So that simple_form can automatically create options for contact select boxes.
  # Please avoid calling this directly.
  # TODO: it would be nice if we could find a better way of doing this..
  #
  def name
    decorate :name
  end
end
