# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  country                :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  first_name             :string
#  last_name              :string
#  locked_at              :datetime
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  time_zone              :string
#  unconfirmed_email      :string
#  unlock_token           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  tenant_id              :integer
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
class User < ApplicationRecord
  devise(
    :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :validatable,
    :confirmable,
    :lockable,
    :timeoutable
  )

  belongs_to :tenant, optional: true

  has_many :notes
  has_many :tasks
  has_many :contacts
  has_many :companies
  has_many :calendar_events
  has_many :equipment
  has_many :forms
  has_many :projects

  has_many :stars
  has_many :starred_companies, through: :stars, source: :starrable, source_type: 'Company'
  has_many :starred_contacts, through: :stars, source: :starrable, source_type: 'Contact'
  has_many :starred_projects, through: :stars, source: :starrable, source_type: 'Project'

  decorate_with UserDecorator
end
