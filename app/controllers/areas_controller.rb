class AreasController < ApplicationController
    def index
        @areas = Area.all
        render json: @areas
    end
    
    def show
        @area = Area.find(params[:id])
        render json: @area
    end

    def companies
        @companies = Company.where(area_id: params[:id])
        render json: @companies
    end
end
