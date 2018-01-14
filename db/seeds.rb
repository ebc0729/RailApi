# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

puts "Delete data"
Area.delete_all
Company.delete_all
Route.delete_all
Station.delete_all
puts "Finish Deleting"

puts "Insert Area"
Area.create({name: '北海道'})
Area.create({name: '東北'})
Area.create({name: '関東'})
Area.create({name: '甲信越'})
Area.create({name: '東海・北陸'})
Area.create({name: '近畿'})
Area.create({name: '中国'})
Area.create({name: '四国'})
Area.create({name: '九州'})
puts "Finish Area"

puts "Insert Company"
CSV.foreach('db/company.csv') do |row|
	Company.create({area_id: row[0], name: row[1]})
end
puts "Finish Company"

puts "Insert Route"
CSV.foreach('db/route.csv') do |row|
	areaId = row[0].to_i
	companyId = Company.find_by({area_id: areaId, name: row[1]}).id
	Route.create({company_id: companyId, name: row[2]})
end
puts "Finish Route"

puts "Insert Station"
CSV.foreach('db/station.csv') do |row|
	areaId = row[0].to_i
	order = row[4].to_i
	company = Company.find_by({area_id: areaId, name: row[1]})
	route = Route.find_by({company_id: company.id, name: row[2]})
	Station.create({route_id: route.id, name: row[3], 'rail_order': order})
end
puts "Finish Station"

puts "Insert Rail"
json = ActiveSupport::JSON.decode(File.read('db/rail.json'))

# 変数jsonに入った配列状態のjsonデータを一つ一つ取り出して、モデル.createを使ってdbに投入
json['features'].each do |data|
	route = Route.find_by({name: data['properties']['路線名']})
	if route.nil? then
		p data['properties']['路線名']
	end
	Rail.create({route_id:route.id, data:data['geometry']['coordinates'].to_s,order:data['properties']['order'],is_station:data['properties']['is_station']})
end
puts "Finish Rail"
