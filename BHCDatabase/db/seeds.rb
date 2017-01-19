# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "David Robertson", email: "david@david.com", password:
"david123", password_confirmation: "david123")
User.create(name: "David Brown", email: "david@david.com", password:
"david123", password_confirmation: "david123")
User.create(name: "Maria Papadopoulou", email: "maria@maria.com", password:
"maria123", password_confirmation: "maria123")
User.create(name: "Jaklin Yordanova", email: "jaklin@jaklin.com", password:
"jaklin123", password_confirmation: "jaklin123")
User.create(name: "Chris Harris", email: "chris@chris.com", password:
"chris123", password_confirmation: "chris123")
User.create(name: "Kiril Mihaylov", email: "kiril@kiril.com", password:
"kiril123", password_confirmation: "kiril123")

@area = Area.create(name: "Dumfries & Lower Nithsdale", description: "blah")
Area.create(name: "West Wigtownshire", description: "blah")
Area.create(name: "The Machars", description: "blah")
Area.create(name: "Upper Nithsdale", description: "blah")

@area.initiatives.create(name: "Dancerise", description: "blah")
Initiative.create(name: "Scrimp and Sew", description: "blah")
Initiative.create(name: "Inkspirations", description: "blah")
Initiative.create(name: "Chair Based Exercise", description: "blah")
