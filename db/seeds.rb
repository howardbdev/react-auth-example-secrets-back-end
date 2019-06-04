# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

chris = User.create(name: "Chris", email: "chris@chris.com", password: "password")
babs = User.create(name: "Babs", email: "babs@babs.com", password: "password")
howard = User.create(name: "Howard", email: "howard@howard.com", password: "password")

chris.secrets.create(content: "I secretly want to finish this course!")
chris.secrets.create(content: "I dream about winning a new car!")
howard.secrets.create(content: "I love the Moana soundtrack!")
howard.secrets.create(content: "I could eat a gallon of guacomole or hummus daily")
howard.secrets.create(content: "I tell way too many Dad jokes -- and I started before I was a dad!  .... and I don't have them on the spot ... they are mostly puns that just come to me")
babs.secrets.create(content: "I can't function without coffee!!")
