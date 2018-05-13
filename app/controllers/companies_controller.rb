class CompaniesController < ApplicationController
    def index
        if params[:area_id].present?
            @companies = Company.where(area_id: params[:area_id])
        else
            @companies = Company.all
        end

        render json: @companies
    end

    def show
        @company = Company.find(params[:id])
        render json: @company
    end
end
