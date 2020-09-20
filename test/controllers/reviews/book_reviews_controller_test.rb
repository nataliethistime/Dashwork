require 'test_helper'

module Reviews
  class BookReviewsControllerTest < ActionController::TestCase
    include Devise::Test::ControllerHelpers

    setup do
      @reviews_book_review = reviews_book_reviews(:one)
      @user = users(:one)
      sign_in @user
    end

    test 'should get index' do
      get :index
      assert_response :success
    end

    test 'should get new' do
      get :new
      assert_response :success
    end

    test 'should create reviews_book_review' do
      assert_difference('Reviews::BookReview.count', 1) do
        post :create, params: {
          reviews_book_review: {
            title: @reviews_book_review.title,
            author: @reviews_book_review.author,
            rating: @reviews_book_review.rating,
            thoughts: @reviews_book_review.thoughts
          }
        }
      end

      assert_redirected_to reviews_book_review_url(Reviews::BookReview.last)
    end

    test 'should show reviews_book_review' do
      get :show, params: { id: @reviews_book_review.id }
      assert_response :success
    end

    test 'should get edit' do
      get :edit, params: { id: @reviews_book_review.id }
      assert_response :success
    end

    test 'should update reviews_book_review' do
      patch :update, params: {
        id: @reviews_book_review.id,
        reviews_book_review: {
          author: 'Maya Angelou'
        }
      }
      assert_redirected_to reviews_book_review_url(@reviews_book_review)
    end

    test 'should destroy reviews_book_review' do
      assert_difference('Reviews::BookReview.count', -1) do
        delete :destroy, params: { id: @reviews_book_review.id }
      end

      assert_redirected_to reviews_book_reviews_url
    end
  end
end
