get '/responses' do 
	@user = User.find(session[:user_id])
	@user_surveys = UserSurvey.where(user_id: session[:user_id])
	erb :'responses/index'
end

get '/surveys/:id/responses/new' do 
	@survey = Survey.find(params[:id])
	@questions = @survey.questions
	erb :'responses/new'
end


post '/surveys/:id/responses' do 
	@survey = Survey.find(params[:id])
	user_survey = UserSurvey.create(survey_id: @survey.id, user_id: session[:user_id], complete: true)
	params[:choice].each do |question_id, option_id|
		Response.create(option_id: option_id, user_survey_id: user_survey.id)
	end
	redirect "/responses"
end