class CompaniesController < ApplicationController
    def index
        @companies = Company.all
        render json: @companies
    end
    
    def show
        @company = Company.find(params[:id])
        render json: @company
    end

    def routes
        @routes = Route.where(company_id: params[:id])
        render json: @routes
    end

end
