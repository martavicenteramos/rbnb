# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
puts "Deleting all models"

Review.destroy_all
Booking.destroy_all
Picture.destroy_all
Dog.destroy_all
User.destroy_all
Booking.destroy_all


puts "Generating Users"
puts "Login user"
puts "Email: test@email.com"
puts "Password 00000000 (8 0s)"
puts "Conan The Barbarian is the admin"
User.create!(
  email: "test@email.com",
  password: '00000000',
  first_name: "Conan",
  last_name:"The Barbarian"
  )

puts "Generating 10 fake users"
puts "All users with password 123456"

10.times do
  User.create!(
    email: Faker::Internet.email,
    password: '123456',
    first_name:Faker::Name.first_name,
    last_name:Faker::Name.last_name,
  )
end

puts "10 users without photos created"
puts '...'
puts "Creating 20 dogs"
puts "With no photos"

cities = ["lisbon", "paris", "london", "porto", "coimbra", "amsterdam", "venice"]

20.times do
  Dog.create!(
   name:Faker::Creature::Dog.name,
   user: User.all.sample,
   description:Faker::TvShows::GameOfThrones.quote,
   size: %w[Small Medium Large].sample,
   age: rand(0..15),
   breed: Faker::Creature::Dog.breed,
   gender: %w[Male Female].sample,
   location: Faker::Address.full_address,
   city: cities.sample,
   zip_code: Faker::Address.zip_code
   )
end
puts "Dogs and users have been created"

puts "Generating bookings"

Dog.all.each do |dog|

  Booking.create!(
    user_id: User.all.sample.id,
    dog_id: dog.id,
    status: %w[rejected accepted pending].sample,
    start_date: Faker::Date.backward(days: 14),
    end_date:Faker::Date.forward(days: 14)
    )

  Booking.create!(
  user_id: User.all.sample.id,
  dog_id: dog.id,
  status: %w[rejected accepted pending].sample,
  start_date: Faker::Date.in_date_period(year: 2017),
  end_date:Faker::Date.in_date_period(year: 2018)
  )

  Review.create!(
    rating: rand(1..10),
    description: Faker::Quote.yoda,
    booking_id: Booking.last.id
    )

  Booking.create!(
  user_id: User.all.sample.id,
  dog_id: dog.id,
  status: %w[rejected accepted pending].sample,
  start_date: Faker::Date.in_date_period(year: 2015),
  end_date:Faker::Date.in_date_period(year: 2016)
  )

  Review.create!(
    rating: rand(1..10),
    description: Faker::Quote.most_interesting_man_in_the_world,
    booking_id: Booking.last.id
    )

end




