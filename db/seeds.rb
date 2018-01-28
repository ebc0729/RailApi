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
Area.create do |a|
	a.id = 1
	a.name = '北海道'
end
Area.create do |a|
	a.id = 2
	a.name = '東北'
end
Area.create do |a|
	a.id = 3
	a.name = '関東'
end
Area.create do |a|
	a.id = 4
	a.name = '甲信越'
end
Area.create do |a|
	a.id = 5
	a.name = '東海・北陸'
end
Area.create do |a|
	a.id = 6
	a.name = '近畿'
end
Area.create do |a|
	a.id = 7
	a.name = '中国'
end
Area.create do |a|
	a.id = 8
	a.name = '四国'
end
Area.create do |a|
	a.id = 9
	a.name = '九州'
end
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
	if company.nil? then
		p '会社:' + row[1]
	end
	route = Route.find_by({company_id: company.id, name: row[2]})
	if route.nil? then
		p '路線:' + row[2]
	end
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
	Rail.create({route_id:route.id, data:data['geometry']['coordinates'].to_s, rail_order:data['properties']['order'],is_station:data['properties']['is_station']})
end
puts "Finish Rail"
