# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Faker::Config.locale = 'en-GB'

random = Random.new

# Helper function that provides error handling when adding seeds to the database. In an ideal world this is't optimal
#   but since this seed file won't be run often, if at all, this is satisfactory.
def with_record_unique_handling
  yield
rescue ActiveRecord::RecordNotUnique => e
  puts e
end

puts "ConstraintException is normal and expected. Don't panic!\n"

# Add admins to the database

puts 'Inserting admins'

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

puts 'Inserting volunteers'

User.create(name: 'Volunteer', email: 'volunteer@volunteer.com', password: 'volunteer123', password_confirmation: 'volunteer123',
            telephone: Faker::PhoneNumber.phone_number, emergency_contact: Faker::PhoneNumber.phone_number,
            dob: Faker::Date.between(70.years.ago, 18.years.ago), privilege: 1)

random.rand(20..50).times do
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

puts 'Inserting service users'

User.create(name: 'User', email: 'user@user.com', password: 'user123', password_confirmation: 'user123',
            telephone: Faker::PhoneNumber.phone_number, emergency_contact: Faker::PhoneNumber.phone_number,
            dob: Faker::Date.between(70.years.ago, 18.years.ago), privilege: 2, feedback_due: 1.months.ago)

random.rand(100..200).times do
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

puts 'Inserting areas with initiatives'

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

puts 'Inserting meetings/sessions for initiatives'

Initiative.all.each do |init|
  random.rand(5..50).times do
    init.meetings.create(datetime: Faker::Time.between(2.years.ago, DateTime.now), attendance: 0)
  end
end

# Add medical conditions

puts 'Inserting medical conditions'

MedicalCondition.create(name: 'Asthma', description: Faker::StarWars.quote)
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

# Main bulk of questions, these are the questions that a user is asked upon registration, and can leave at any time they
#   wish.

puts 'Inserting questions'

# WMWEBS questions
#   “none of the time, rarely, some of the time, often, all of the time”
Question.create(question: "I've been feeling optimistic about the future", visible: true, question_type: 0)
Question.create(question: "I've been feeling useful", visible: true, question_type: 0)
Question.create(question: "I've been feeling relaxed", visible: true, question_type: 0)
Question.create(question: "I've been dealing with problems well", visible: true, question_type: 0)
Question.create(question: "I've been thinking clearly", visible: true, question_type: 0)
Question.create(question: "I've been feeling close to other people", visible: true, question_type: 0)
Question.create(question: "I've been able to make up my own mind about things", visible: true, question_type: 0)
Question.create(question: 'I exercise on a regular basis', visible: true, question_type: 0)
Question.create(question: 'My daily life is filled with things that interest me', visible: true, question_type: 0)
Question.create(question: 'I feel strongly connected to the neighbourhood that I live in', visible: true, question_type: 0)
Question.create(question: 'I can influence decisions affecting my local area', visible: true, question_type: 0)
Question.create(question: 'Most people I come into contact with can be trusted', visible: true, question_type: 0)
Question.create(question: 'How happy are you with your relationships? This can include any relationships.', visible: true, question_type: 0)
Question.create(question: 'How happy are you with the state of your health?', visible: true, question_type: 0)
# Social capital face to face question
#   “less than monthly, 1-3 times per month, 1-2 times per week, 3 times per or more”
Question.create(question: 'How often do you have face-to-face contact with friends or family not living with you?', visible: true, question_type: 1)
# Social capital connected question
#   “very strongly connected, connected, somewhat connected, weakly connected, not connected at all”
Question.create(question: 'How strongly connected do you feel to the neighbourhood you live in?', visible: true, question_type: 2)
# Social capital influence question
#   “strongly agree, agree, neither agree or disagree, disagree, strongly disagree”
Question.create(question: "How much do you agree or disagree with the following statement? 'I can influence decisions affecting my local area'", visible: true, question_type: 3)
# Social capital trust question
#   “most people can be trusted, need to be very careful”
Question.create(question: 'Generally speaking, would you say that most people can be trusted or that you need to be very careful in dealing with people?', visible: true, question_type: 4)


# Add attendance, feedback/answers, enrollment and medical conditions to users
puts 'Inserting attendance, feedback/answers, enrollment and medical conditions for users'

User.where(privilege: 2).each do |user|
  random.rand(1..3).times do
    user.enrolments.create(initiative: Initiative.find(Faker::Number.between(1, Initiative.count)))
    with_record_unique_handling{user.conditions.create(medical_condition: MedicalCondition.find(Faker::Number.between(1, MedicalCondition.count)))}
    Feedback.create(user: user)
  end

  # user.initiatives.each do |init|
  #   init.meetings.each do |meet|
  #     user.attendances.create(meeting: meet)
  #   end
  # end

  user.feedbacks.each do |feed|
    Question.all.each do |question|
      with_record_unique_handling{Answer.create(feedback: feed, question: question, response: Faker::StarWars.quote)}
    end

  end
end

# Add attendance and enrolment to volunteers

puts 'Inserting enrollment for volunteers'

User.where(privilege: 1).each do |user|
  random.rand(1..2).times do
    user.enrolments.create(initiative: Initiative.find(Faker::Number.between(1, Initiative.count)))
  end

  # user.initiatives.each do |init|
  #   init.meetings.each do |meet|
  #     user.attendances.create(meeting: meet)
  #   end
  # end

end

# Generate random funders

puts 'Inserting funders'

random.rand(30..40).times do
  @funder = Funder.create(name: Faker::Company.name,
                address: Faker::StarWars.planet,
                url: Faker::Internet.url,
                description: Faker::ChuckNorris.fact,
                email: Faker::Internet.email,
                telephone: Faker::PhoneNumber.phone_number)
  random.rand(3..5).times do
    @funder.initiative_funders.create(initiative: Initiative.find(Faker::Number.between(1, Initiative.count)))
  end
  random.rand(3..5).times do
    @funder.medical_condition_funders.create(medical_condition: MedicalCondition.find(Faker::Number.between(1, MedicalCondition.count)))
  end
  random.rand(3..5).times do
    @funder.user_funders.create(user: User.find(Faker::Number.between(1, User.count)))
  end
end
