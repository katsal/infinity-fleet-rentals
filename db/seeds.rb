
require 'faker'

User.destroy_all

User.create!(
  email: "Barry@infinityfleetrentals.com",
  password: "password1",
  name: "Admin Barry",
  phone_number: "123-456-7891",
  address: "Address One",
  date_of_birth: Date.new(1990, 1, 1)
)

User.create!(
  email: "karthika@infinityfleetrentals.com",
  password: "password2",
  name: "Admin Karthika",
  phone_number: "123-456-7892",
  address: "Address Two",
  date_of_birth: Date.new(1990, 2, 2)
)

User.create!(
  email: "Caitlyn@infinityfleetrentals.com",
  password: "password3",
  name: "Admin Caitlyn",
  phone_number: "123-456-7893",
  address: "Address Three",
  date_of_birth: Date.new(1990, 3, 3)
)

User.create!(
  email: "Kostas@infinityfleetrentals.com",
  password: "password4",
  name: "Admin kostas",
  phone_number: "123-456-7894",
  address: "Address Four",
  date_of_birth: Date.new(1990, 4, 4)
)

20.times do
  email = Faker::Internet.unique.email
  user = User.new(email: email)

  if user.save
    puts "Created user: #{user.email}"
  else
    puts "Failed to create user: #{user.email} - Errors: #{user.errors.full_messages.join(', ')}"
  end
end

20.times do |i|
  user_id = i + 1
  ship = Ship.new(
    user_id: user_id,
    description: Faker::Lorem.paragraph_by_chars(number: rand(50..220)),
    capacity: rand(1..500),
    price_per_day: rand(50..500)
  )

  if ship.save
    puts "Created ship with ID #{ship.id} and user_id #{user_id}"
  else
    puts "Failed to create ship - Errors: #{ship.errors.full_messages.join(', ')}"
  end
end
