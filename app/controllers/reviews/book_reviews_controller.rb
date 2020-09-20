module Reviews
  class BookReviewsController < ApplicationController
    before_action :set_reviews_book_review, only: [:show, :edit, :update, :destroy]

    # GET /reviews/book_reviews
    # GET /reviews/book_reviews.json
    def index
      @reviews_book_reviews = current_user.book_reviews.all
    end

    # GET /reviews/book_reviews/1
    # GET /reviews/book_reviews/1.json
    def show
    end

    # GET /reviews/book_reviews/new
    def new
      @reviews_book_review = current_user.book_reviews.new
    end

    # GET /reviews/book_reviews/1/edit
    def edit
    end

    # POST /reviews/book_reviews
    # POST /reviews/book_reviews.json
    def create
      @reviews_book_review = current_user.book_reviews.new(reviews_book_review_params)

      respond_to do |format|
        if @reviews_book_review.save
          format.html { redirect_to @reviews_book_review, notice: 'Book review was successfully created.' }
          format.json { render :show, status: :created, location: @reviews_book_review }
        else
          format.html { render :new }
          format.json { render json: @reviews_book_review.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /reviews/book_reviews/1
    # PATCH/PUT /reviews/book_reviews/1.json
    def update
      respond_to do |format|
        if @reviews_book_review.update(reviews_book_review_params)
          format.html { redirect_to @reviews_book_review, notice: 'Book review was successfully updated.' }
          format.json { render :show, status: :ok, location: @reviews_book_review }
        else
          format.html { render :edit }
          format.json { render json: @reviews_book_review.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /reviews/book_reviews/1
    # DELETE /reviews/book_reviews/1.json
    def destroy
      @reviews_book_review.destroy
      respond_to do |format|
        format.html { redirect_to reviews_book_reviews_url, notice: 'Book review was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def sidebar
      :reviews
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_reviews_book_review
      @reviews_book_review = current_user.book_reviews.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reviews_book_review_params
      params.require(:reviews_book_review).permit(:title, :author, :thoughts, :rating)
    end
  end
end
