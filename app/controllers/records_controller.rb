class RecordsController < ApplicationController
    def index
        json_params = JSON.parse(request.body.read)
        user_id = json_params['user_id'].to_i
        # ユーザの存在確認
        user = User.find_by(id: user_id)
        if user.nil?
            render json: {'message': 'No User'}, status: 400 and return
        end
        route_id = json_params['route_id'].to_i
        # 路線の存在確認
        route = Route.find_by(id: route_id)
        if route.nil?
            render json: {'message': 'No route'}, status: 400 and return
        end
        # start_stationとend_stationの取得
        start_order = json_params['start_order'].to_i
        end_order = json_params['end_order'].to_i
        start_station = Station.find_by({route_id: route_id, rail_order: start_order})
        end_station = Station.find_by({route_id: route_id, rail_order: end_order})
        if start_station.nil? || end_station.nil?
            render json: {'message': 'Invalid start_order or end_order'}, status: 400 and return
        end
        record_attr = {
            'user_id': user_id,
            'route_id': route_id,
            'start_station_id': start_station.id,
            'end_station_id': end_station.id
        }
        record = Record.new
        record.attributes = record_attr
        unless record.save
            render json: {'message': 'Failed to save record'}, status: 400 and return
        else
            render json: {'message': 'Success'}, status: 200 and return
        end
    end
end
