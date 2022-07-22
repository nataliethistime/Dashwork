# == Schema Information
#
# Table name: companies
#
#  id          :integer          not null, primary key
#  address     :string
#  description :text
#  email       :string
#  name        :string
#  phone       :string
#  website     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  tenant_id   :integer          not null
#  user_id     :integer          not null
#
class Company < ApplicationRecord
  belongs_to :tenant
  belongs_to :user
  has_many :contacts
  has_many :forms
  has_many :notes
  has_many :tasks

  has_many :project_companies
  has_many :projects, through: :project_companies

  has_many :calendar_event_companies
  has_many :calendar_events, through: :calendar_event_companies

  has_many :wiki_page_companies, class_name: 'Wiki::PageCompany'
  has_many :wiki_pages, source: 'page', class_name: 'Wiki::Page', through: :wiki_page_companies

  decorate_with CompanyDecorator

  default_scope -> { order(:name) }
  scope :newly_created, -> { all.reorder(created_at: :desc) }

  include CustomFieldable
  include Taggable
  include Starrable
end
