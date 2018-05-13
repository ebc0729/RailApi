class StationsController < ApplicationController
  def index
    if params[:route_id].present?
        @stations = Station
                    .where(route_id: params[:route_id])
                    .order('rail_order')
    else
        @stations = Station.all
    end

    render json: @stations
  end

  def show
    @station = Station.find(params[:id])
    render json: @station
  end
end
