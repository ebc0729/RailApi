require 'json'
class RailsController < ApplicationController
    def generates
        json_params = JSON.parse(request.body.read)
        route_id = json_params['route_id'].to_i
        start_order = json_params['start_order'].to_i
        end_order = json_params['end_order'].to_i
        if start_order > end_order then
            start_order, end_order = end_order, start_order
        end
        order = Rail.arel_table[:order]
        @rails = Rail.where({'route_id': route_id})
            .where(order.gteq(start_order).and(order.lteq(end_order)))
        unless @rails then
            render json: {'message': 'No rails'}, status: 400
            return
        end
        render json: @rails
    end
end
