# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  locked_at              :datetime
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
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

  has_many :notes, -> (user) { where(tenant_id: user.tenant_id) }
  has_many :tasks, -> (user) { where(tenant_id: user.tenant_id) }
  has_many :contacts, -> (user) { where(tenant_id: user.tenant_id) }
  has_many :companies, -> (user) { where(tenant_id: user.tenant_id) }
  has_many :calendar_events, -> (user) { where(tenant_id: user.tenant_id) }
  has_many :equipment, -> (user) { where(tenant_id: user.tenant_id) }
  has_many :forms, -> (user) { where(tenant_id: user.tenant_id) }
  has_many :projects, -> (user) { where(tenant_id: user.tenant_id) }
end
