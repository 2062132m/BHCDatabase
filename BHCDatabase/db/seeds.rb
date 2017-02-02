# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Faker::Config.locale = 'en-GB'

User.create(name: 'David Robertson', email: 'david@david.com', password: 'david123', password_confirmation: 'david123',
            telephone: Faker::PhoneNumber.phone_number,
            dob: Faker::Date.between(70.years.ago, 18.years.ago), privilege: 0)
User.create(name: 'David Brown', email: 'david@david.com', password: 'david123', password_confirmation: 'david123',
            telephone: Faker::PhoneNumber.phone_number,
            dob: Faker::Date.between(70.years.ago, 18.years.ago), privilege: 0)
User.create(name: 'Maria Papadopoulou', email: 'maria@maria.com', password: 'maria123', password_confirmation: 'maria123',
            telephone: Faker::PhoneNumber.phone_number,
            dob: Faker::Date.between(70.years.ago, 18.years.ago), privilege: 0)
User.create(name: 'Jaklin Yordanova', email: 'jaklin@jaklin.com', password: 'jaklin123', password_confirmation: 'jaklin123',
            telephone: Faker::PhoneNumber.phone_number,
            dob: Faker::Date.between(70.years.ago, 18.years.ago), privilege: 0)
User.create(name: 'Chris Harris', email: 'chris@chris.com', password: 'chris123', password_confirmation: 'chris123',
            telephone: Faker::PhoneNumber.phone_number,
            dob: Faker::Date.between(70.years.ago, 18.years.ago), privilege: 0)
User.create(name: 'Kiril Mihaylov', email: 'kiril@kiril.com', password: 'kiril123', password_confirmation: 'kiril123',
            telephone: Faker::PhoneNumber.phone_number,
            dob: Faker::Date.between(70.years.ago, 18.years.ago), privilege: 0)

# Add volunteers to the database
Faker::Number.between(20, 50).times do
  password = Faker::Internet.password
  User.create(name: Faker::Name.name,
              email: Faker::Internet.email,
              password: password,
              password_confirmation: password,
              telephone: Faker::PhoneNumber.phone_number,
              dob: Faker::Date.between(70.years.ago, 18.years.ago),
              privilege: 1)
end

@area1 = Area.create(name: 'Dumfries & Lower Nithsdale', description: Faker::StarWars.quote)
@init1 = @area1.initiatives.create(name: 'Scrimp and sew', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
Faker::Number.between(5, 10).times do
  @init1.meetings.create(datetime: Faker::Time.between(2.years.ago, DateTime.now))
end
@init2 = @area1.initiatives.create(name: 'Writing Group', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
Faker::Number.between(5, 10).times do
  @init2.meetings.create(datetime: Faker::Time.between(2.years.ago, DateTime.now))
end
@init3 = @area1.initiatives.create(name: 'Inkspirations', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
Faker::Number.between(5, 10).times do
  @init3.meetings.create(datetime: Faker::Time.between(2.years.ago, DateTime.now))
end
@init4 = @area1.initiatives.create(name: 'Arts and crafts', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
Faker::Number.between(5, 10).times do
  @init4.meetings.create(datetime: Faker::Time.between(2.years.ago, DateTime.now))
end
@init5 = @area1.initiatives.create(name: 'Drop in craft', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
Faker::Number.between(5, 10).times do
  @init5.meetings.create(datetime: Faker::Time.between(2.years.ago, DateTime.now))
end
@init6 = @area1.initiatives.create(name: 'Tai chi Heathall', description: Faker::StarWars.quote, location: 'Heathall')
Faker::Number.between(5, 10).times do
  @init6.meetings.create(datetime: Faker::Time.between(2.years.ago, DateTime.now))
end
@init7 = @area1.initiatives.create(name: 'Tai chi Cumberland day centre', description: Faker::StarWars.quote, location: 'Cumberland day centre')
Faker::Number.between(5, 10).times do
  @init7.meetings.create(datetime: Faker::Time.between(2.years.ago, DateTime.now))
end
@init8 = @area1.initiatives.create(name: 'Tai chi NWRC', description: Faker::StarWars.quote, location: 'NWRC')
Faker::Number.between(5, 10).times do
  @init8.meetings.create(datetime: Faker::Time.between(2.years.ago, DateTime.now))
end
@init9 = @area1.initiatives.create(name: 'Tai chi Summerhill', description: Faker::StarWars.quote, location: 'Summerhill')
Faker::Number.between(5, 10).times do
  @init9.meetings.create(datetime: Faker::Time.between(2.years.ago, DateTime.now))
end
@init10 = @area1.initiatives.create(name: 'Tai chi Lincluden', description: Faker::StarWars.quote, location: 'Lincluden')
Faker::Number.between(5, 10).times do
  @init10.meetings.create(datetime: Faker::Time.between(2.years.ago, DateTime.now))
end
@init1 = @area1.initiatives.create(name: 'Tai chi Hollywood', description: Faker::StarWars.quote, location: 'Hollywood')
Faker::Number.between(5, 10).times do
  @init10.meetings.create(datetime: Faker::Time.between(2.years.ago, DateTime.now))
end

@area2 = Area.create(name: "West \n Wigtownshire", description: Faker::StarWars.quote)
@area2.initiatives.create(name: 'Chair based exercise', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
@area2.initiatives.create(name: 'Tai Chi 50+', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
@area2.initiatives.create(name: 'SHAWL group', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
@area2.initiatives.create(name: 'Tai chi for health', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
@area2.initiatives.create(name: 'Tai chi Potters', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
@area2.initiatives.create(name: 'Tai chi Phoenix', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
@area2.initiatives.create(name: 'SHAWL Group art', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
@area2.initiatives.create(name: 'Boccia & NAC', description: Faker::StarWars.quote, location: Faker::StarWars.planet)

@area3 = Area.create(name: "The \n Machars", description: Faker::StarWars.quote)
@area3.initiatives.create(name: 'Monday Club', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
@area3.initiatives.create(name: 'Boccia/NAC', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
@area3.initiatives.create(name: 'Dancercise', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
@area3.initiatives.create(name: 'Jills of all trades', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
@area3.initiatives.create(name: 'Jills in the community', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
@area3.initiatives.create(name: 'I.O.W. Arts', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
@area3.initiatives.create(name: 'Login &Connect', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
@area3.initiatives.create(name: 'Gentle Exercise', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
@area3.initiatives.create(name: 'IOW Youth', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
@area3.initiatives.create(name: 'Vol Drop in', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
@area3.initiatives.create(name: 'Scrabble4fun', description: Faker::StarWars.quote, location: Faker::StarWars.planet)

@area4 = Area.create(name: "Upper \n Nithsdale", description: Faker::StarWars.quote)
@area4.initiatives.create(name: 'Singing group', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
@area4.initiatives.create(name: 'Qijong', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
@area4.initiatives.create(name: 'Monday Munchers', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
@area4.initiatives.create(name: 'Hard of hearing', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
@area4.initiatives.create(name: 'Tai chi Sanquar', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
@area4.initiatives.create(name: 'Lifestyles', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
@area4.initiatives.create(name: 'Drop in', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
@area4.initiatives.create(name: 'Criss Cross', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
@area4.initiatives.create(name: 'Tai Chi Kirconnel', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
@area4.initiatives.create(name: 'Walk for Health', description: Faker::StarWars.quote, location: Faker::StarWars.planet)

MedicalCondition.create(name: 'Physical Disability', description: Faker::StarWars.quote)
MedicalCondition.create(name: 'Learning Disability', description: Faker::StarWars.quote)
MedicalCondition.create(name: 'Mental Health', description: Faker::StarWars.quote)
MedicalCondition.create(name: 'Heart Disease', description: Faker::StarWars.quote)
MedicalCondition.create(name: 'Stroke', description: Faker::StarWars.quote)
MedicalCondition.create(name: 'High Blood Pressure', description: Faker::StarWars.quote)
MedicalCondition.create(name: 'Diabetes Type 1 or 2', description: Faker::StarWars.quote)
MedicalCondition.create(name: 'Cancer', description: Faker::StarWars.quote)
MedicalCondition.create(name: 'Arthritis', description: Faker::StarWars.quote)
MedicalCondition.create(name: 'Dementia', description: Faker::StarWars.quote)
MedicalCondition.create(name: 'Autistic Spectrum Disorder', description: Faker::StarWars.quote)
MedicalCondition.create(name: "Parkinson's Disease", description: Faker::StarWars.quote)
MedicalCondition.create(name: 'Chronic Obstructive Pulmonary Disease', description: Faker::StarWars.quote)
MedicalCondition.create(name: 'Multiple Sclerosis', description: Faker::StarWars.quote)
MedicalCondition.create(name: 'Fibromyalgia', description: Faker::StarWars.quote)
MedicalCondition.create(name: 'Chronic Back Problem', description: Faker::StarWars.quote)





