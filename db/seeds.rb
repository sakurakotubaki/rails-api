# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
products = [
  { name: '牛乳', description: '生乳100%' },
  { name: '卵', description: '鶏卵100%' },
  { name: 'パン', description: '小麦粉100%' }
]

products.each do |product|
  Product.create!(product)
end