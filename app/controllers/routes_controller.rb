class RoutesController < ApplicationController
    def index
        @routes = Route.all
        render json: @routes
    end
    
    def show
        @route = Route.find(params[:id])
        render json: @route
    end

    def stations
        @stations = Station.where(route_id: params[:id]).order('rail_order')
        render json: @stations
    end
end
