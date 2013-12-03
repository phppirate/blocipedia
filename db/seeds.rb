# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

wikis = []
100.times do
  wikis << Wiki.create(
    name: Faker::Lorem.words(rand(1..10)).join(" "), 
    description: Faker::Lorem.paragraph(rand(1..4)),
    body: Faker::Lorem.paragraph(rand(1..10))
  )
end 

rand(40..100).times do
  password = Faker::Lorem.characters(10)
  u = User.new(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: password,
      password_confirmation: password)

  u.save
end  

u = User.new(
    name: 'Sam Podlogar',
    email: 'sam@podlogar.com',
    password: 'pZ7%V~a95fQ',
    password_confirmation: 'pZ7%V~a95fQ')
u.save   



puts "#{Wiki.count} Wikis"
puts "#{User.count} Users"

