require 'JSON'
class RailsController < ApplicationController
    def index
        p request.body.read
        json_params = JSON.parse(request.body.read)
        line_id = json_params['line_id'].to_i
        start_order = json_params['start_order'].to_i
        end_order = json_params['end_order'].to_i
        if start_order > end_order then
            start_order, end_order = end_order, start_order
        end
        order = Rail.arel_table[:order]
        @rails = Rail.where({'line_id': line_id})
            .where(order.gteq(start_order).and(order.lteq(end_order)))
        unless @rails then
            render json: {'message': 'No rails'}, status: 400
            return
        end
        render json: @rails
    end
end
