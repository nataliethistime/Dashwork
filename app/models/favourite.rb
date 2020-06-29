# == Schema Information
#
# Table name: favourites
#
#  id                :bigint           not null, primary key
#  favouritable_type :string
#  favouritable_id   :bigint
#  user_id           :bigint
#
# Indexes
#
#  index_favourites_on_favouritable_type_and_favouritable_id  (favouritable_type,favouritable_id)
#  index_favourites_on_user_id                                (user_id)
#
class Favourite < ApplicationRecord
  belongs_to :favouritable, polymorphic: true
  belongs_to :user
end
