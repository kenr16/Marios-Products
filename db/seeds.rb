# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all

50.times do |index|
  Product.create!(name: Faker::Food.ingredient,
                  price: Faker::Number.decimal(2, 2),
                  country: Faker::Address.country,
                  description: Faker::Lorem.sentence(20, false, 0).chop,
                  picture: "http://cdn.primedia.co.za/primedia-broadcasting/image/upload/c_fill,h_289,q_70,w_463/k7mr17bdmm5npgpgnvxl")

end

p "Created #{Product.count} products"

Review.destroy_all

250.times do |index|
  Review.create!(author: Faker::Food.ingredient,
                 rating: Faker::Number.decimal(2, 2),
                 content: Faker::TwinPeaks.quote,
                 product_id: Faker::Number.between(1, 50))

end

p "Created #{Review.count} products"
