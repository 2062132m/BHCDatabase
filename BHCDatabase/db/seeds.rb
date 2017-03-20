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

# Add test admin, volunteer and service user
puts 'Inserting test users to the database'
User.create(forename: 'Admin',
            surname: Faker::Name.last_name,
            known_as: 'Admin',
            email: 'admin@admin.com',
            password: 'admin123',
            password_confirmation: 'admin123',
            telephone: Faker::PhoneNumber.phone_number,
            dob: Faker::Date.between(70.years.ago, 18.years.ago),
            reg_date: Faker::Date.between(2.years.ago, 1.weeks.ago),
            address1: Faker::Address.street_address,
            address2: Faker::Address.secondary_address,
            town: Faker::Address.city,
            postcode: Faker::Address.postcode,
            privilege: 0)
User.create(forename: 'Volunteer',
            surname: Faker::Name.last_name,
            known_as: 'Volunteer',
            email: 'volunteer@volunteer.com',
            password: 'volunteer123',
            password_confirmation: 'volunteer123',
            telephone: Faker::PhoneNumber.phone_number,
            dob: Faker::Date.between(70.years.ago, 18.years.ago),
            reg_date: Faker::Date.between(2.years.ago, 1.weeks.ago),
            emergency_name: Faker::Name.name,
            emergency_telephone: Faker::PhoneNumber.phone_number,
            address1: Faker::Address.street_address,
            address2: Faker::Address.secondary_address,
            town: Faker::Address.city,
            postcode: Faker::Address.postcode,
            aims: User.aims[:improve_health],
            aims_other: Faker::Lorem.sentence,
            privilege: 1,
            feedback_due: 1.months.ago)
User.create(forename: 'Service',
            surname: 'User',
            known_as: 'Service',
            email: 'user@user.com',
            password: 'user123',
            password_confirmation: 'user123',
            telephone: Faker::PhoneNumber.phone_number,
            dob: Faker::Date.between(70.years.ago, 18.years.ago),
            reg_date: Faker::Date.between(2.years.ago, 1.weeks.ago),
            emergency_name: Faker::Name.name,
            emergency_telephone: Faker::PhoneNumber.phone_number,
            address1: Faker::Address.street_address,
            address2: Faker::Address.secondary_address,
            town: Faker::Address.city,
            postcode: Faker::Address.postcode,
            aims: User.aims[:improve_health],
            aims_other: Faker::Lorem.sentence,
            privilege: 2,
            feedback_due: 1.months.ago)

# Add volunteers
puts 'Inserting volunteers'
random.rand(50..100).times do
  password = Faker::Internet.password
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  @user = User.create(forename: first_name,
                      surname: last_name,
                      known_as: first_name + ' ' + last_name,
                      email: Faker::Internet.email,
                      password: password,
                      password_confirmation: password,
                      telephone: Faker::PhoneNumber.phone_number,
                      dob: Faker::Date.between(70.years.ago, 18.years.ago),
                      reg_date: Faker::Date.between(2.years.ago, 1.weeks.ago),
                      emergency_name: Faker::Name.name,
                      emergency_telephone: Faker::PhoneNumber.phone_number,
                      address1: Faker::Address.street_address,
                      address2: Faker::Address.secondary_address,
                      town: Faker::Address.city,
                      postcode: Faker::Address.postcode,
                      aims: User.aims[:improve_health],
                      aims_other: Faker::Lorem.sentence,
                      feedback_due: 6.months.from_now,
                      privilege: 1)
end

# Add service users
puts 'Inserting service users'
random.rand(400..500).times do
  password = Faker::Internet.password
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  @user = User.create(forename: first_name,
                      surname: last_name,
                      known_as: first_name + ' ' + last_name,
                      email: Faker::Internet.email,
                      password: password,
                      password_confirmation: password,
                      telephone: Faker::PhoneNumber.phone_number,
                      dob: Faker::Date.between(70.years.ago, 18.years.ago),
                      reg_date: Faker::Date.between(2.years.ago, 1.weeks.ago),
                      emergency_name: Faker::Name.name,
                      emergency_telephone: Faker::PhoneNumber.phone_number,
                      address1: Faker::Address.street_address,
                      address2: Faker::Address.secondary_address,
                      town: Faker::Address.city,
                      postcode: Faker::Address.postcode,
                      aims: User.aims[:improve_health],
                      aims_other: Faker::Lorem.sentence,
                      privilege: 2,
                      feedback_due: 6.months.from_now)
end
# Create areas with their initiatives
puts 'Inserting areas with initiatives'
@area1 = Area.create(name: 'Dumfries & Lower Nithsdale', description: Faker::Lorem.paragraph)
@area1.initiatives.create(name: 'Scrimp and sew', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area1.initiatives.create(name: 'Writing Group', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area1.initiatives.create(name: 'Inkspirations', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area1.initiatives.create(name: 'Arts and crafts', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area1.initiatives.create(name: 'Drop in craft', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area1.initiatives.create(name: 'Tai chi Heathall', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area1.initiatives.create(name: 'Tai chi Cumberland day centre', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area1.initiatives.create(name: 'Tai chi NWRC', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area1.initiatives.create(name: 'Tai chi Summerhill', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area1.initiatives.create(name: 'Tai chi Lincluden', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area1.initiatives.create(name: 'Tai chi Hollywood', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area2 = Area.create(name: "West \n Wigtownshire", description: Faker::Lorem.paragraph)
@area2.initiatives.create(name: 'Chair based exercise', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area2.initiatives.create(name: 'Tai Chi 50+', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area2.initiatives.create(name: 'SHAWL group', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area2.initiatives.create(name: 'Tai chi for health', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area2.initiatives.create(name: 'Tai chi Potters', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area2.initiatives.create(name: 'Tai chi Phoenix', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area2.initiatives.create(name: 'SHAWL Group art', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area2.initiatives.create(name: 'Boccia & NAC', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area3 = Area.create(name: "The \n Machars", description: Faker::Lorem.paragraph)
@area3.initiatives.create(name: 'Monday Club', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area3.initiatives.create(name: 'Boccia/NAC', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area3.initiatives.create(name: 'Dancercise', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area3.initiatives.create(name: 'Jills of all trades', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area3.initiatives.create(name: 'Jills in the community', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area3.initiatives.create(name: 'I.O.W. Arts', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area3.initiatives.create(name: 'Login &Connect', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area3.initiatives.create(name: 'Gentle Exercise', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area3.initiatives.create(name: 'IOW Youth', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area3.initiatives.create(name: 'Vol Drop in', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area3.initiatives.create(name: 'Scrabble4fun', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area4 = Area.create(name: "Upper \n Nithsdale", description: Faker::Lorem.paragraph)
@area4.initiatives.create(name: 'Singing group', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area4.initiatives.create(name: 'Qijong', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area4.initiatives.create(name: 'Monday Munchers', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area4.initiatives.create(name: 'Hard of hearing', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area4.initiatives.create(name: 'Tai chi Sanquar', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area4.initiatives.create(name: 'Lifestyles', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area4.initiatives.create(name: 'Drop in', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area4.initiatives.create(name: 'Criss Cross', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area4.initiatives.create(name: 'Tai Chi Kirconnel', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)
@area4.initiatives.create(name: 'Walk for Health', description: Faker::Lorem.paragraph, location: Faker::Address.full_address)

# Add medical conditions
puts 'Inserting medical conditions'
MedicalCondition.create(name: 'Asthma', description: Faker::Lorem.paragraph)
MedicalCondition.create(name: 'Physical Disability', description: Faker::Lorem.paragraph)
MedicalCondition.create(name: 'Learning Disability', description: Faker::Lorem.paragraph)
MedicalCondition.create(name: 'Mental Health', description: Faker::Lorem.paragraph)
MedicalCondition.create(name: 'Heart Disease', description: Faker::Lorem.paragraph)
MedicalCondition.create(name: 'Stroke', description: Faker::Lorem.paragraph)
MedicalCondition.create(name: 'High Blood Pressure', description: Faker::Lorem.paragraph)
MedicalCondition.create(name: 'Diabetes Type 1 or 2', description: Faker::Lorem.paragraph)
MedicalCondition.create(name: 'Cancer', description: Faker::Lorem.paragraph)
MedicalCondition.create(name: 'Arthritis', description: Faker::Lorem.paragraph)
MedicalCondition.create(name: 'Dementia', description: Faker::Lorem.paragraph)
MedicalCondition.create(name: 'Autistic Spectrum Disorder', description: Faker::Lorem.paragraph)
MedicalCondition.create(name: "Parkinson's Disease", description: Faker::Lorem.paragraph)
MedicalCondition.create(name: 'Chronic Obstructive Pulmonary Disease', description: Faker::Lorem.paragraph)
MedicalCondition.create(name: 'Multiple Sclerosis', description: Faker::Lorem.paragraph)
MedicalCondition.create(name: 'Fibromyalgia', description: Faker::Lorem.paragraph)
MedicalCondition.create(name: 'Chronic Back Problem', description: Faker::Lorem.paragraph)
Faker
# Main bulk of questions, these are the questions that a user is asked upon registration, and can leave at any time they
#   wish.
# Warwick-Edinburgh Mental Well-Being Scale (WEMWBS)
#   “none of the time, rarely, some of the time, often, all of the time”
puts 'Inserting questions'
Question.create(question: "I've been feeling optimistic about the future", visible: true, question_type: 0)
Question.create(question: "I've been feeling useful", visible: true, question_type: 0)
Question.create(question: "I've been feeling relaxed", visible: true, question_type: 0)
Question.create(question: "I've been feeling interested in people", visible: true, question_type: 0)
Question.create(question: "I've had energy to spare", visible: true, question_type: 0)
Question.create(question: "I've been dealing well with problems", visible: true, question_type: 0)
Question.create(question: "I've been thinking clearly", visible: true, question_type: 0)
Question.create(question: "I've been feeling good about myself", visible: true, question_type: 0)
Question.create(question: "I've been feeling close to other people", visible: true, question_type: 0)
Question.create(question: "I've been feeling confident", visible: true, question_type: 0)
Question.create(question: "I've been able to make up my own mind about things", visible: true, question_type: 0)
Question.create(question: "I've been feeling loved", visible: true, question_type: 0)
Question.create(question: "I've been interested in new things", visible: true, question_type: 0)
Question.create(question: "I've been feeling cheerful", visible: true, question_type: 0)
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

# Add meetings to all initiatives
puts 'Inserting meetings/sessions for initiatives'
Initiative.find_each do |init|
  random.rand(5..50).times do
    init.meetings.create(datetime: Faker::Time.between(2.years.ago, Time.current), attendance: 0)
  end
end
puts "Enrolling users\nGiving users feedback\nUsers attending meetings"
# Add attendance, feedback/answers, enrollment and medical conditions to users
User.where(privilege: [1, 2]).find_each do |user|
  random.rand(1..3).times do
    user.enrolments.create(initiative: Initiative.find(random.rand(1..Initiative.count)))
    with_record_unique_handling { user.conditions.create(medical_condition: MedicalCondition.find(random.rand(1..MedicalCondition.count)), created_at: Faker::Time.between(2.years.ago, Time.current)) }
    Feedback.create(user: user)
  end
  user.feedbacks.find_each do |feed|
    Question.find_each do |question|
      with_record_unique_handling { Answer.create(feedback: feed, question: question, response: Faker::Lorem.word) }
    end
  end
  user.initiatives.each do |init|
    init.meetings.each do |meet|
      user.attendances.create(meeting: meet, created_at: meet.datetime) if random.rand(100) > 25
    end
  end
end

puts 'Calculating attendance percentage for initiatives'

Initiative.find_each do |init|
  number_of_enrolled = Enrolment.where(initiative_id: init.id).count
  init.meetings.find_each do |meet|
    number_of_attended = Attendance.where(meeting_id: meet.id).count
    meet.update_attribute(:attendance, (number_of_attended.to_f/number_of_enrolled.to_f * 100))
  end
end

# Generate random funders
puts 'Inserting funders'
random.rand(30..40).times do
  @funder = Funder.create(name: Faker::Company.name,
                          address: Faker::Address.full_address,
                          url: Faker::Internet.url,
                          description: Faker::Lorem.paragraph,
                          email: Faker::Internet.email,
                          telephone: Faker::PhoneNumber.phone_number)
  random.rand(3..5).times do
    @funder.initiative_funders.create(initiative: Initiative.find(random.rand(1..Initiative.count)))
  end
  random.rand(3..5).times do
    @funder.medical_condition_funders.create(medical_condition: MedicalCondition.find(random.rand(1..MedicalCondition.count)))
  end
  random.rand(3..5).times do
    @funder.user_funders.create(user: User.find(random.rand(1..User.count)))
  end
end
