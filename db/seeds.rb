# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

#  CREATION OF USERS ------------------------------------
10.times do
  User.create(email: "#{Faker::Games::Pokemon.name}@yopmail.com", encrypted_password: "tequilabière", description: Faker::Movies::BackToTheFuture.quote, first_name: Faker::Games::Heroes.name, last_name: Faker::FunnyName.name)
end

# CREATION OF EVENTS ---------------------------------------

3.times do
  Event.create(title: Faker::Movie.title, start_date: DateTime.parse("2022-12-12 20:00"), duration: 35, description: Faker::TvShows::TheFreshPrinceOfBelAir.quote, price: rand(1..1000), location: Faker::TvShows::HeyArnold.location, admin: User.all.sample)
end

# FILL JOIN TABLE -------------------------------------------

for i in 1..3 
  rand(2..6).times do
    Attendance.create(event_id: i, customer: User.all.sample, stripe_customer_id: Faker::Blockchain::Bitcoin.address)
  end
end