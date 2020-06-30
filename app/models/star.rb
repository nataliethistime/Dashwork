# == Schema Information
#
# Table name: stars
#
#  id             :bigint           not null, primary key
#  starrable_type :string
#  starrable_id   :bigint
#  user_id        :bigint
#
# Indexes
#
#  index_stars_on_starrable_type_and_starrable_id  (starrable_type,starrable_id)
#  index_stars_on_user_id                          (user_id)
#
class Star < ApplicationRecord
  belongs_to :starrable, polymorphic: true
  belongs_to :user
end
