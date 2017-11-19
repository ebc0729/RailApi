class StationsController < ApplicationController
  def index
    @stations = Station.all
    render json: @stations
  end

  def show
    @station = Station.find(params[:id])
    render json: @station
  end

  def lines
    name = Station.find(params[:id]).name
    lines = Station.where(name: name).select('line_id')

    @lines = lines.map{|line|
      Line.find(line.line_id)
    }
    render json: @lines
  end
end
