# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
  { name: "Tank Top", image: "cloth_1.jpg", price: 50000, description: "Až ti bude horko u sledování burzovních zpráv." },
  { name: "Konversky z Číny", image: "shoe_1.jpg", price: 175000, description: "Neboj, my máme rychlejší, než jsou tyhle." },
  { name: "Polo", image: "cloth_2.jpg", price: 75000, description: "Ohlodáme tvoje investice až na kost." },
].each do |attributes|
  Product.where(attributes).first_or_create!
end
