
# Create Users
20.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(minimum_length=6)
    )
end

users = User.all

# Create Items
100.times do
  item = Item.create!(
    name: Faker::Lorem.sentence(word_count=4),
    user: users.sample
    )
end

puts "Seed Finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
