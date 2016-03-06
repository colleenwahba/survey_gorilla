

#create 10 dummy users
# users = 10.times.map do
#   User.create!(
#                 :email      => Faker::Internet.email,
#                 :password   => 'password' )
# end

User.create!(email: "guywhomadeit.com", password: 'password')
User.create(email: "iamtakingit.com", password: 'password')
User.create(email: "jp@jp.jp", password: 'jpjp')

Survey.create(owner_id: 1, title: "books")

	Question.create(survey_id: 1, content: "how old are you?")
	Option.create(question_id: 1, text: "three")
	Option.create(question_id: 1, text: "7")
	Option.create(question_id: 1, text: "4")

Survey.create(owner_id: 2, title: "peanuts")

	Question.create(survey_id: 2, content: "where is my hair brush?")
	Option.create(question_id: 2, text: "Here")
	Option.create(question_id: 2, text: "There")
	Option.create(question_id: 2, text: "Everywhere!")

	Question.create(survey_id: 2, content: "where is your favorite coffee spot?")
	Option.create(question_id: 3, text: "Starbucks")
	Option.create(question_id: 3, text: "Boyd Coffee Co.")
	Option.create(question_id: 3, text: "Walmart")

UserSurvey.create(survey_id: 1, user_id: 2)
Response.create(user_survey_id: 1, option_id: 2) #answer 7.

UserSurvey.create(survey_id: 2, user_id: 3)
Response.create(user_survey_id: 2, option_id: 2)
Response.create(user_survey_id: 2, option_id: 2)

# access the user's response to a survey question 
#Option.find(tookit.user_surveys.first.responses.first.option_id).text




