10.times do
  Station.create(name: Faker::Address.city)
  Exercise.create(name: Faker::Lorem.word)
end