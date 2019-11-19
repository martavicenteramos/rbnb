# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
puts "Deleting all models"

# Dog.destroy_all
# User.destroy_all
# Booking.destroy_all
# Picture.destroy_all
# Review.destroy_all

puts "Generating Users"
puts "Login user"
puts "Email: test@email.com"
puts "Password 000000"

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

20.times do
  Dog.create!(
   name:Faker::FunnyName.name,
   user: User.all.sample,
   description:Faker::Creature::Dog.meme_phrase,
   size: %w[small medium large].sample,
   age: rand(0..15),
   breed: Faker::Creature::Dog.breed,
   gender: %w[male female].sample,
   location: Faker::Address.full_address
   )
end


puts "Dogs and users have been created"

