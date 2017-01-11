require 'faker'

# Create Users
5.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password'
  )
  user.skip_confirmation!
  user.save!
end

tyler = User.create!(
  name: 'Tyler Cooper',
  email: 'tyler.cooper91@gmail.com',
  password: 'password'
)

tyler.skip_confirmation!
tyler.save!

users = User.all
puts "#{User.count} users created"

# Create items
25.times do
  Item.create!(
    user: users.sample,
    name: Faker::Lorem.sentence
  )
end
items = Item.all
puts "#{Item.count} items created"
puts "Seed finished"
