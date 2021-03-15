class CigarsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @cigars = Cigar.all
    end

    def show
        @cigar = Cigar.find_by_id(params[:id])
    end

    def new
        @cigar = Cigar.new
        @cigar.build_brand
    end

    def create
        @cigar = Cigar.new(cigar_params)
        @cigar.user_id = session[:user_id]
        if @cigar.save
            redirect_to cigar_path(@cigar)
        else
            render :new
        end
    end

    def edit
        @cigar = Cigar.find(params[:id])
    end

    def update
        @cigar = Cigar.find(params[:id])
        @cigar.update(cigar_params)
        redirect_to cigar_path(@cigar)
    end

    private

    def cigar_params
        params.require(:cigar).permit(:name, :style, :brand_id, brand_attributes: [:name])
    end

end
