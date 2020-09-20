class BookReviewDecorator < DecoratorBase
  def rating(book_review)
    "#{book_review.rating}/10"
  end

  def thoughts(book_review)
    format book_review.thoughts, as: :markdown
  end
end
