class CreateReviewsBookReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews_book_reviews do |t|
      t.string :title
      t.string :author
      t.text :thoughts
      t.integer :rating
      t.belongs_to :user
      t.timestamps
    end
  end
end
