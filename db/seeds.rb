# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

brands  = 1.upto(10).map { Faker::Appliance.brand }
display = [ "LCD", "LED", "QLED" ]
sizes   = [ 42, 50, 55, 60, 65, 75, 80, 85 ]

Television.delete_all

ApplicationRecord.transaction do
  1000.times do
    Television.create(
      brand: brands.sample,
      name:  Faker::Lorem.word,
      display: display.sample,
      price: rand(200..4000),
      size: sizes.sample,
      year: rand(2010..2019),
    )
  end
end

Television.reindex
