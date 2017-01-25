# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Faker::Config.locale = 'en-GB'

User.create(name: "David Robertson", email: "david@david.com", password: "david123", password_confirmation: "david123",
            telephone: Faker::PhoneNumber.phone_number,
            dob: Faker::Date.between(70.years.ago, 18.years.ago), privilege: "true")
User.create(name: "David Brown", email: "david@david.com", password: "david123", password_confirmation: "david123",
            telephone: Faker::PhoneNumber.phone_number,
            dob: Faker::Date.between(70.years.ago, 18.years.ago), privilege: "true")
User.create(name: "Maria Papadopoulou", email: "maria@maria.com", password: "maria123", password_confirmation: "maria123",
            telephone: Faker::PhoneNumber.phone_number,
            dob: Faker::Date.between(70.years.ago, 18.years.ago), privilege: "true")
User.create(name: "Jaklin Yordanova", email: "jaklin@jaklin.com", password: "jaklin123", password_confirmation: "jaklin123",
            telephone: Faker::PhoneNumber.phone_number,
            dob: Faker::Date.between(70.years.ago, 18.years.ago), privilege: "true")
User.create(name: "Chris Harris", email: "chris@chris.com", password: "chris123", password_confirmation: "chris123",
            telephone: Faker::PhoneNumber.phone_number,
            dob: Faker::Date.between(70.years.ago, 18.years.ago), privilege: "true")
User.create(name: "Kiril Mihaylov", email: "kiril@kiril.com", password: "kiril123", password_confirmation: "kiril123",
            telephone: Faker::PhoneNumber.phone_number,
            dob: Faker::Date.between(70.years.ago, 18.years.ago), privilege: "true")

Faker::Number.between(20, 50).times do
  password = Faker::Internet.password
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: password, password_confirmation: password, telephone: Faker::PhoneNumber.phone_number, dob: Faker::Date.between(70.years.ago, 18.years.ago), privilege: false)
end

@area1 = Area.create(name: "Dumfries & Lower Nithsdale", description: Faker::Lorem.sentence)
@area1.initiatives.create(name: "Scrimp and sew", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)
@area1.initiatives.create(name: "Writing Group", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)
@area1.initiatives.create(name: "Inkspirations", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)
@area1.initiatives.create(name: "Arts and crafts", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)
@area1.initiatives.create(name: "Drop in craft", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)
@area1.initiatives.create(name: "Tai chi Heathall", description: Faker::Lorem.sentence, location: "Heathall")
@area1.initiatives.create(name: "Tai chi Cumberland day centre", description: Faker::Lorem.sentence, location: "Cumberland day centre")
@area1.initiatives.create(name: "Tai chi NWRC", description: Faker::Lorem.sentence, location: "NWRC")
@area1.initiatives.create(name: "Tai chi Summerhill", description: Faker::Lorem.sentence, location: "Summerhill")
@area1.initiatives.create(name: "Tai chi Lincluden", description: Faker::Lorem.sentence, location: "Lincluden")
@area1.initiatives.create(name: "Tai chi Hollywood", description: Faker::Lorem.sentence, location: "Hollywood")

@area2 = Area.create(name: "West \n Wigtownshire", description: Faker::Lorem.sentence)
@area2.initiatives.create(name: "Chair based exercise", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)
@area2.initiatives.create(name: "Tai Chi 50+", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)
@area2.initiatives.create(name: "SHAWL group", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)
@area2.initiatives.create(name: "Tai chi for health", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)
@area2.initiatives.create(name: "Tai chi Potters", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)
@area2.initiatives.create(name: "Tai chi Phoenix", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)
@area2.initiatives.create(name: "SHAWL Group art", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)
@area2.initiatives.create(name: "Boccia & NAC", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)

@area3 = Area.create(name: "The \n Machars", description: Faker::Lorem.sentence)
@area3.initiatives.create(name: "Monday Club", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)
@area3.initiatives.create(name: "Boccia/NAC", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)
@area3.initiatives.create(name: "Dancercise", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)
@area3.initiatives.create(name: "Jills of all trades", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)
@area3.initiatives.create(name: "Jills in the community", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)
@area3.initiatives.create(name: "I.O.W. Arts", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)
@area3.initiatives.create(name: "Login &Connect", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)
@area3.initiatives.create(name: "Gentle Exercise", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)
@area3.initiatives.create(name: "IOW Youth", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)
@area3.initiatives.create(name: "Vol Drop in", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)
@area3.initiatives.create(name: "Scrabble4fun", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)

@area4 = Area.create(name: "Upper \n Nithsdale", description: Faker::Lorem.sentence)
@area4.initiatives.create(name: "Singing group", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)
@area4.initiatives.create(name: "Qijong", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)
@area4.initiatives.create(name: "Monday Munchers", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)
@area4.initiatives.create(name: "Hard of hearing", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)
@area4.initiatives.create(name: "Tai chi Sanquar", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)
@area4.initiatives.create(name: "Lifestyles", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)
@area4.initiatives.create(name: "Drop in", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)
@area4.initiatives.create(name: "Criss Cross", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)
@area4.initiatives.create(name: "Tai Chi Kirconnel", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)
@area4.initiatives.create(name: "Walk for Health", description: Faker::Lorem.sentence, location: Faker::StarWars.planet)

@testinitiative = @area1.initiatives.create(name: "I am a test.",
                                            description: "I am test description.",
                                            location: "I am a test location.")

Faker::Number.between(5, 10).times do
  @testinitiative.meetings.create(datetime: Faker::Time.between(2.years.ago, DateTime.now))
end