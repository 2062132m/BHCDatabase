# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "David Robertson", email: "david@david.com", password:
"david123", password_confirmation: "david123", telephone: "0123456789",
dob: "1111-11-11", privilege: "true")
User.create(name: "David Brown", email: "david@david.com", password:
"david123", password_confirmation: "david123", telephone: "0123456789",
dob: "1111-11-11", privilege: "true")
User.create(name: "Maria Papadopoulou", email: "maria@maria.com", password:
"maria123", password_confirmation: "maria123", telephone: "0123456789",
dob: "1111-11-11", privilege: "true")
User.create(name: "Jaklin Yordanova", email: "jaklin@jaklin.com", password:
"jaklin123", password_confirmation: "jaklin123", telephone: "0123456789",
dob: "1111-11-11", privilege: "true")
User.create(name: "Chris Harris", email: "chris@chris.com", password:
"chris123", password_confirmation: "chris123", telephone: "0123456789",
dob: "1111-11-11", privilege: "true")
User.create(name: "Kiril Mihaylov", email: "kiril@kiril.com", password:
"kiril123", password_confirmation: "kiril123", telephone: "0123456789",
dob: "1111-11-11", privilege: "true")

User.create(name: "Volunteer", email: "volunteer@volunteer.com", password:
"volunteer123", password_confirmation: "volunteer123", telephone: "0123456789",
dob: "1111-11-11", privilege: "false")

@area1 = Area.create(name: "Dumfries & Lower Nithsdale", description: "this is dumfries")
@area1.initiatives.create(name:"Scrimp and sew", description: "this is a description", location: "Town Hall")
@area1.initiatives.create(name:"Writing Group", description: "Crafternoons", location: "Town Hall")
@area1.initiatives.create(name:"Inkspirations", description: "this is a description", location: "Town Hall")
@area1.initiatives.create(name:"Arts and crafts", description: "this is a description", location: "Town Hall")
@area1.initiatives.create(name:"Drop in craft", description: "this is a description", location: "Town Hall")
@area1.initiatives.create(name:"Tai chi Heathall", description: "this is a description", location: "Heathall")
@area1.initiatives.create(name:"Tai chi Cumberland day centre", description: "this is a description", location: "Cumberland day centre")
@area1.initiatives.create(name:"Tai chi NWRC", description: "this is a description", location: "NWRC")
@area1.initiatives.create(name:"Tai chi Summerhill", description: "this is a description", location: "Summerhill")
@area1.initiatives.create(name:"Tai chi Lincluden", description: "this is a description", location: "Lincluden")
@area1.initiatives.create(name:"Tai chi Hollywood", description: "this is a description", location: "Hollywood")

@area2 = Area.create(name: "West \n Wigtownshire", description: "this is west")
@area2.initiatives.create(name:"Chair based exercise", description: "this is a description", location: "Hollywood")
@area2.initiatives.create(name:"Tai Chi 50+", description: "this is a description", location: "Hollywood")
@area2.initiatives.create(name:"SHAWL group", description: "this is a description", location: "Hollywood")
@area2.initiatives.create(name:"Tai chi for health", description: "this is a description", location: "Hollywood")
@area2.initiatives.create(name:"Tai chi Potters", description: "this is a description", location: "Hollywood")
@area2.initiatives.create(name:"Tai chi Phoenix", description: "this is a description", location: "Hollywood")
@area2.initiatives.create(name:"SHAWL Group art", description: "this is a description", location: "Hollywood")
@area2.initiatives.create(name:"Boccia & NAC", description: "this is a description", location: "Hollywood")

@area3 = Area.create(name: "The \n Machars", description: "this is machars")
@area3.initiatives.create(name:"Monday Club", description: "this is a description", location: "Town Hall")
@area3.initiatives.create(name:"Boccia/NAC", description: "this is a description", location: "Town Hall")
@area3.initiatives.create(name:"Dancercise", description: "this is a description", location: "Town Hall")
@area3.initiatives.create(name:"Jills of all trades", description: "this is a description", location: "Town Hall")
@area3.initiatives.create(name:"Jills in the community", description: "this is a description", location: "Town Hall")
@area3.initiatives.create(name:"I.O.W. Arts", description: "this is a description", location: "Town Hall")
@area3.initiatives.create(name:"Login &Connect", description: "this is a description", location: "Town Hall")
@area3.initiatives.create(name:"Gentle Exercise", description: "this is a description", location: "Town Hall")
@area3.initiatives.create(name:"IOW Youth", description: "this is a description", location: "Town Hall")
@area3.initiatives.create(name:"Vol Drop in", description: "this is a description", location: "Town Hall")
@area3.initiatives.create(name:"Scrabble4fun", description: "this is a description", location: "Town Hall")

@area4 = Area.create(name: "Upper \n Nithsdale", description: "this is upper")
@area4.initiatives.create(name:"Singing group", description: "this is a description", location: "Town Hall")
@area4.initiatives.create(name:"Qijong", description: "this is a description", location: "Town Hall")
@area4.initiatives.create(name:"Monday Munchers", description: "this is a description", location: "Town Hall")
@area4.initiatives.create(name:"Hard of hearing", description: "this is a description", location: "Town Hall")
@area4.initiatives.create(name:"Tai chi Sanquar", description: "this is a description", location: "Town Hall")
@area4.initiatives.create(name:"Lifestyles", description: "this is a description", location: "Town Hall")
@area4.initiatives.create(name:"Drop in", description: "this is a description", location: "Town Hall")
@area4.initiatives.create(name:"Criss Cross", description: "this is a description", location: "Town Hall")
@area4.initiatives.create(name:"Tai Chi Kirconnel", description: "this is a description", location: "Town Hall")
@area4.initiatives.create(name:"Walk for Health", description: "this is a description", location: "Town Hall")

@testinitiative = @area1.initiatives.create(name:"I am a test.",
                                    description: "I am test description.",
                                    location: "I am a test location.")
@testinitiative.meetings.create(datetime:Time.now)
