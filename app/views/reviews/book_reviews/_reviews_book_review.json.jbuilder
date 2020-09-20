json.extract! reviews_book_review, :id, :string, :string, :text, :int, :created_at, :updated_at
json.url reviews_book_review_url(reviews_book_review, format: :json)
