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
module Reviews
  class BookReview < ApplicationRecord
    belongs_to :user

    validates :author, presence: true
    validates :title, presence: true
    validates :rating, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 10 }

    decorate_with BookReviewDecorator
  end
end
