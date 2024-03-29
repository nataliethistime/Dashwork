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
#  pronouns       :string
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

  has_many :calendar_event_contacts
  has_many :calendar_events, through: :calendar_event_contacts

  has_many :wiki_page_contacts, class_name: 'Wiki::PageContact'
  has_many :wiki_pages, source: 'page', class_name: 'Wiki::Page', through: :wiki_page_contacts

  include CustomFieldable
  include Taggable
  include Starrable

  TITLES = %w[Mr Mrs Ms Dr Prof Sir]

  validates :title, inclusion: { in: TITLES }, allow_blank: true

  default_scope -> { order(:first_name) }
  scope :newly_created, -> { all.reorder(created_at: :desc) }

  #
  # So that simple_form can automatically create options for contact select boxes.
  # Please avoid calling this directly.
  # TODO: it would be nice if we could find a better way of doing this..
  #
  def name
    decorate :name
  end
end
