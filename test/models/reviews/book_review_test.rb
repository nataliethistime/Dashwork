# == Schema Information
#
# Table name: reviews_book_reviews
#
#  id         :bigint           not null, primary key
#  author     :string
#  rating     :integer
#  thoughts   :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_reviews_book_reviews_on_user_id  (user_id)
#
require 'test_helper'

class Reviews::BookReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
