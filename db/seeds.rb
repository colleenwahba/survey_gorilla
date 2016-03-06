

#create 10 dummy users
# users = 10.times.map do
#   User.create!(
#                 :email      => Faker::Internet.email,
#                 :password   => 'password' )
# end

User.create!(email: "guywhomadeit.com", password: 'password')
User.create(email: "iamtakingit.com", password: 'password')

Survey.create(owner_id: 1, title: "books")
Survey.create(owner_id: 2, title: "peanuts")

UserSurvey.create(survey_id: 1, user_id: 2)

Question.create(survey_id: 1, content: "how old are you?")
Option.create(question_id: 1, text: "three")
Option.create(question_id: 1, text: "7")
Option.create(question_id: 1, text: "4")


Response.create(user_survey_id: 1, option_id: 2) #answer 7. 

# access the user's response to a survey question 
#Option.find(tookit.user_surveys.first.responses.first.option_id).text




