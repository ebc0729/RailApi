class RailsController < ApplicationController
    def index
        start_station = Station.find(params[:start].to_i)
        end_staion = Station.find(params[:end].to_i)
        start_order = start_station['rail_order']
        end_order = end_staion['rail_order']
        p start_order
        if start_order > end_order then
            start_order, end_order = end_order, start_order
        end
        order = Rail.arel_table[:order]
        @rails = Rail.where(order.gteq(start_order).and(order.lteq(end_order)))
        render json: @rails
    end
end
