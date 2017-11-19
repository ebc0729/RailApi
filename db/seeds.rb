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
Line.delete_all
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

puts "Insert Line"
CSV.foreach('db/line.csv') do |row|
	areaId = row[0].to_i
	companyId = Company.find_by({area_id: areaId, name: row[1]}).id
	Line.create({company_id: companyId, name: row[2]})
end
puts "Finish Line"

puts "Insert Station"
CSV.foreach('db/station.csv') do |row|
	areaId = row[0].to_i
	companyId = Company.find_by({area_id: areaId, name: row[1]}).id
	lineId = Line.find_by({company_id: companyId, name: row[2]}).id
	Station.create({line_id: lineId, name: row[3]})
end
puts "Finish Station"

