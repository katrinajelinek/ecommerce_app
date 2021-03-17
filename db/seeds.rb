# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  {
    first_name: "Tami",
    last_name: "Test",
    email: "test@gmail.com",
    password: "password",
    password_confirmation: "password",
  },
)
Product.create!([
  {
    name: "Electric Standing Desk",
    price: 259.99,
    description: "#1 rated electric standing desk. World-class support. 7-year warranty. 30-day trial. Enjoy the benefits of a standing desk: increased energy, productivity and overall activity.",
    inventory: 250,
  },
  {
    name: "Desk Lamp",
    price: 53.99,
    description: "LED Desk Lamp, Touch Control Desk Lamp with 3 Levels Brightness, Dimmable Office Lamp with Adjustable Arm, Foldable Table Desk Lamp for Table Bedroom.",
    inventory: 78,
  },
  {
    name: "Wireless Bluetooth Mouse",
    price: 39.99,
    description: "The Logitech M720 Triathlon wireless mouse features superior device connectivity with the ability to connect via both USB port and Bluetooth. The sculpted, ergonomic construction ensures comfortable use and puts the scroll wheel and buttons within easy reach. For even more personalized flexibility, the buttons are fully customizable. Simply press one button to effortlessly switch between three different computers without having to change any connections. To reduce office waste, this mouse can last as long as 24 months on one AA battery.",
    inventory: 343,
  },
])
