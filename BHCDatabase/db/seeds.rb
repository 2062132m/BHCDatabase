# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Faker::Config.locale = 'en-GB'

# Add admins to the database

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

User.create(name: 'Volunteer', email: 'volunteer@volunteer.com', password: 'volunteer123', password_confirmation: 'volunteer123',
            telephone: Faker::PhoneNumber.phone_number,
            dob: Faker::Date.between(70.years.ago, 18.years.ago), privilege: 1)

Faker::Number.between(20, 50).times do
  password = Faker::Internet.password
  User.create(name: Faker::Name.name,
              email: Faker::Internet.email,
              password: password,
              password_confirmation: password,
              telephone: Faker::PhoneNumber.phone_number,
              emergency_contact: Faker::PhoneNumber.phone_number,
              dob: Faker::Date.between(70.years.ago, 18.years.ago),
              privilege: 1)
end

# Add users to the database

User.create(name: 'User', email: 'user@user.com', password: 'user123', password_confirmation: 'user123',
            telephone: Faker::PhoneNumber.phone_number, emergency_contact: Faker::PhoneNumber.phone_number,
            dob: Faker::Date.between(70.years.ago, 18.years.ago), privilege: 2, feedback_due: 1.months.ago)

Faker::Number.between(100, 200).times do
  password = Faker::Internet.password
  @user = User.create(name: Faker::Name.name,
                      email: Faker::Internet.email,
                      password: password,
                      password_confirmation: password,
                      telephone: Faker::PhoneNumber.phone_number,
                      emergency_contact: Faker::PhoneNumber.phone_number,
                      dob: Faker::Date.between(70.years.ago, 18.years.ago),
                      privilege: 2,
                      feedback_due: 6.months.from_now)
end

# Create area1 with initiatives

@area1 = Area.create(name: 'Dumfries & Lower Nithsdale', description: Faker::StarWars.quote)
@area1.initiatives.create(name: 'Scrimp and sew', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
@area1.initiatives.create(name: 'Writing Group', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
@area1.initiatives.create(name: 'Inkspirations', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
@area1.initiatives.create(name: 'Arts and crafts', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
@area1.initiatives.create(name: 'Drop in craft', description: Faker::StarWars.quote, location: Faker::StarWars.planet)
@area1.initiatives.create(name: 'Tai chi Heathall', description: Faker::StarWars.quote, location: 'Heathall')
@area1.initiatives.create(name: 'Tai chi Cumberland day centre', description: Faker::StarWars.quote, location: 'Cumberland day centre')
@area1.initiatives.create(name: 'Tai chi NWRC', description: Faker::StarWars.quote, location: 'NWRC')
@area1.initiatives.create(name: 'Tai chi Summerhill', description: Faker::StarWars.quote, location: 'Summerhill')
@area1.initiatives.create(name: 'Tai chi Lincluden', description: Faker::StarWars.quote, location: 'Lincluden')
@area1.initiatives.create(name: 'Tai chi Hollywood', description: Faker::StarWars.quote, location: 'Hollywood')

# Create other areas with their initiatives

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


# Add meetings to all initiatives

Initiative.all.each do |init|
  Faker::Number.between(5, 50).times do
    init.meetings.create(datetime: Faker::Time.between(2.years.ago, DateTime.now), attendance: 0)
  end
end

# Add medical conditions

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

# Questions

Question.create(question: "I've been feeling optimistic about the future", visible: true, sort: 1, multiple_choice: true)
Question.create(question: "I've been feeling useful", visible: true, sort: 2, multiple_choice: true)
Question.create(question: "I've been feeling relaxed", visible: true, sort: 3, multiple_choice: true)
Question.create(question: "I've been dealing with problems well", visible: true, sort: 4, multiple_choice: true)
Question.create(question: "I've been thinking clearly", visible: true, sort: 5, multiple_choice: true)
Question.create(question: "I've been feeling close to other people", visible: true, sort: 6, multiple_choice: true)
Question.create(question: "I've been able to make up my own mind about things", visible: true, sort: 7, multiple_choice: true)
Question.create(question: 'I exercise on a regular basis', visible: true, sort: 8, multiple_choice: true)
Question.create(question: 'My daily life is filled with things that interest me', visible: true, sort: 9, multiple_choice: true)
Question.create(question: 'I feel strongly connected to the neighbourhood that I live in', visible: true, sort: 10, multiple_choice: true)
Question.create(question: 'I can influence decisions affecting my local area', visible: true, sort: 11, multiple_choice: true)
Question.create(question: 'Most people I come into contact with can be trusted', visible: true, sort: 12, multiple_choice: true)
Question.create(question: 'How happy are you with your relationships? This can include any relationships.', visible: true, sort: 13, multiple_choice: true)
Question.create(question: 'How happy are you with the state of your health?', visible: true, sort: 14, multiple_choice: true)
Question.create(question: 'How happy are you generally?', visible: true, sort: 15, multiple_choice: true)
Question.create(question: 'How happy are you with your social life and activities that you are involved in?', visible: true, sort: 16, multiple_choice: true)
Question.create(question: "How much are you influenced by others, in ways that don't help you?", visible: true, sort: 17, multiple_choice: true)
Question.create(question: 'How stressed are you at this time in your life?', visible: true, sort: 18, multiple_choice: true)
Question.create(question: "How much are drugs a part of your life? (This includes prescription drugs)", visible: true, sort: 19, multiple_choice: true)
Question.create(question: 'How often do you see your friends or your neighbours?', visible: true, sort: 20, multiple_choice: true)
Question.create(question: 'How often do you see your family?', visible: true, sort: 21, multiple_choice: true)
Question.create(question: 'Is someone available to help you if you are feeling nervous, sick, need to talk, or need help with chores or caring for yourself?', visible: true, sort: 22, multiple_choice: true)
Question.create(question: 'On a scale of 1 – 10 where 1 is poor and 10 is excellent, What do you think of the initiative that you have been attending?', visible: true, sort: 23, multiple_choice: true)
Question.create(question: 'On a scale of 1 – 10 where 1 is poor and 10 is excellent, What do you think of the initiative that you have been attending?', visible: true, sort: 24, multiple_choice: false)
Question.create(question: 'How do you think attending BHC initiatives or activities has affected your health and wellbeing over the last 3 – 6 months?  This may include visits to doctors,  making new friends, new interests etc...', visible: true, sort: 25, multiple_choice: false)

# Add attendance, feedback/answers, enrollment and medical conditions to users

User.where(privilege: 2).each do |user|
  Faker::Number.between(1, 3).times do
    user.enrolments.create(initiative: Initiative.find(Faker::Number.between(1, Initiative.count)))
    user.conditions.create(medical_condition: MedicalCondition.find(Faker::Number.between(1, MedicalCondition.count)))
    Feedback.create(user: user)
  end

  # user.initiatives.each do |init|
  #   init.meetings.each do |meet|
  #     user.attendances.create(meeting: meet)
  #   end
  # end

  user.feedbacks.each do |feed|
    Question.all.each do |question|
      Answer.create(feedback: feed, question: question, response: Faker::StarWars.quote)
    end

  end
end

# Add attendance and enrolment to volunteers

User.where(privilege: 1).each do |user|
  Faker::Number.between(1, 2).times do
    user.enrolments.create(initiative: Initiative.find(Faker::Number.between(1, Initiative.count)))
  end

  # user.initiatives.each do |init|
  #   init.meetings.each do |meet|
  #     user.attendances.create(meeting: meet)
  #   end
  # end

end

# Answer.create(feedback:Feedback.create(user: user), question: Question.find(Faker::Number.between(1, Question.count)), response: "This is a test")
