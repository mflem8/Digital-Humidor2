class ReviewsController < ApplicationController

    def index
        @reviews = Review.all
    end

    def new
        @cigar = Cigar.find_by_id(params[:cigar_id])
        @review = @cigar.reviews.build
    end

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    def show
        @review = Review.find_by_id(params[:id])
    end

    def destroy
        Review.find(params[:id]).destroy
        redirect_to cigars_path
    end

    private

    def review_params
        params.require(:review).permit(:cigar_id, :stars, :summary)
    end
end
