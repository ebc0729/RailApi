require 'JSON'
class RailsController < ApplicationController
    def index
        json_params = JSON.parse(request.body.read)
        # line_id = json_params['line_id'].to_i
        start_station = Station.find_by(id: json_params['start'].to_i)
        end_station = Station.find_by_id(json_params['end'].to_i)
        if start_station.nil? || end_station.nil? then
            render json: {'message': 'No stations'}, status: 400
            return
        end
        start_order = start_station['rail_order']
        end_order = end_station['rail_order']
        if start_order > end_order then
            start_order, end_order = end_order, start_order
        end
        order = Rail.arel_table[:order]
        unless order then
            render json: {'message': 'No rails'}, status: 400
            return
        end
        @rails = Rail.where(order.gteq(start_order).and(order.lteq(end_order)))
        render json: @rails
    end
end
