# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  description :text
#  end_date    :date
#  name        :string
#  start_date  :date
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  tenant_id   :integer          not null
#  user_id     :integer          not null
#
class Project < ApplicationRecord
  belongs_to :tenant
  belongs_to :user
  has_many :notes
  has_many :tasks
  has_many :forms

  has_many :project_companies
  has_many :companies, through: :project_companies

  has_many :project_contacts
  has_many :contacts, through: :project_contacts

  has_many :calendar_event_projects
  has_many :calendar_events, through: :calendar_event_projects

  # TODO: link equipment

  STATUSES = %w{active closed}.freeze
  validates :status, inclusion: { in: STATUSES }

  def status
    super.presence || 'active'
  end

  def active?
    status == 'active'
  end

  def closed?
    status == 'closed'
  end

  decorate_with ProjectDecorator

  include Taggable
  include CustomFieldable
  include Starrable

  default_scope -> { order(:name) }
  scope :active, -> { where(status: ['active', nil]) }
  scope :closed, -> { where(status: 'closed') }
  scope :newly_created, -> { reorder(created_at: :desc) }
end
