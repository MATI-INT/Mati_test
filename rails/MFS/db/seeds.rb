# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

30.times do |i|
  User.create!(uid: rand(5000),
               provider: 'twitter',
               nickname: "testuser #{i}", image: '', profile_url: 'http://ya.ru')
end