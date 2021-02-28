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

    private

    def cigar_params
        params.require(:cigar).permit(:name, :style, :brand_id, brand_attributes: [:name])
    end

    def set_cigar
        @cigar = Cigar.find_by(params[:id])
        redirect_to cigars_path if !@cigar
    end
end
