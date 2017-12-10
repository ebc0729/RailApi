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
    # params[:id]から駅名、エリアIDを取得
    selected = Station.joins("LEFT OUTER JOIN lines ON stations.line_id = lines.id")
              .joins("LEFT OUTER JOIN companies ON lines.company_id = companies.id")
              .where("stations.id = ?", params[:id])
              .select("companies.area_id AS AreaID", "stations.name AS StationName")
              .first

    if (selected == nil) then
      return head(:bad_request)
    end

    # 駅名、エリアIDから路線名、会社名取得
    lines = Station.joins("LEFT OUTER JOIN lines ON stations.line_id = lines.id")
              .joins("LEFT OUTER JOIN companies ON lines.company_id = companies.id")
              .where("stations.name = ? AND companies.area_id = ?", selected.StationName, selected.AreaID)
              .select("lines.name AS LineName, companies.name AS CompanyName")

    render json: lines
  end
end
