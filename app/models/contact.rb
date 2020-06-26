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
  belongs_to :company, optional: true
  has_many :notes
  has_many :forms
  has_many :notes
  has_many :tasks
  has_many :project_contacts
  has_many :projects, through: :project_contacts
  has_many :contact_contact_groups
  has_many :groups, through: :contact_contact_groups, source: :contact_group
  # TODO: link events

  include CustomFieldable

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
