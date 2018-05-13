class RoutesController < ApplicationController
    def index
      if params[:company_id].present?
          @routes = Route.where(company_id: params[:company_id])
      else
          @routes = Route.all
      end

      render json: @routes
    end

    def show
        @route = Route.find(params[:id])
        render json: @route
    end
end
