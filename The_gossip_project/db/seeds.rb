# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require'faker'

10.times do
	ville = City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end
10.times do
	user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.name, description: Faker::Lorem.paragraphs, email: Faker::Internet.free_email, age: Faker::Number.number(digits: 2), city: City.all.sample)
end

20.times do 
	gossips = Gossipp.create(title: Faker::Lorem.word, content: Faker::Lorem.sentences, user: User.all.sample)
end

10.times do 
	tags = Tag.create(title: Faker::Lorem.word)
end

20.times do
    join = Join.create(tag: Tag.all.sample, gossipp: Gossipp.all.sample)
end

20.times do
	comments = Comment.create(content: Faker::Lorem.paragraphs, user: User.all.sample, gossipp: Gossipp.all.sample)
end

puts "Success" 
