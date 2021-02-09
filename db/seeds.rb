# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "Zach Benson", username: "bensonic", password_digest: "pizza", email: "comeonjets@gmail.com")
User.create(name: "Jason Markson", username: "jjenson", password_digest: "pizza", email: "jasonmarkson76@gmail.com")
User.create(name: "Kathryn Irizarry", username: "borgoreislife", password_digest: "megan", email: "mynameisclaire@yahoo.com")

