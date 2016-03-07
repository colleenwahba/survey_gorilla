require 'pry'

get "/surveys" do
	@user = User.find(session[:user_id])
  @surveys = Survey.all
  erb :"surveys/index"
end

get '/surveys/new' do
	erb :'surveys/new'
end

post '/surveys' do 
	@user_id = session[:user_id]
	Survey.create(owner_id: @user_id, title: params[:title])
	redirect "/home"
end

get "/surveys/:id" do
  @survey = Survey.find(params[:id])
  @questions = @survey.questions
  erb :"surveys/show"
end

get "/surveys/:id/questions/new" do
		@survey = Survey.find(params[:id])
	erb :"questions/new"
end

post "/surveys/:id/questions" do
		@survey = Survey.find(params[:id])
		@question = Question.create(survey_id: params[:id], content: params[:question])
		params[:option_text].each do |option_text|
			@options = Option.create(question_id: @question.id, text: option_text)
		end
		redirect "/surveys/#{@survey.id}" 
end 

get "/surveys/:survey_id/questions/:id/edit" do 
	@survey = Survey.find(params[:survey_id])
	@question = @survey.questions.find_by(id: params[:id])
	erb :"surveys/edit"
end

put "/surveys/:survey_id/questions/:id" do 
	@survey = Survey.find(params[:survey_id])
	@question = Question.find(params[:id])
	original_options = params[:original_option_text]
	original_options.each do |id, option|
		if option[0] == ""
			Option.find(id).destroy
		else
			Option.find(id).update_attributes(text: option[0])
		end
	end
	params[:option_text].each do |option_text|
		Option.create(question_id: @question.id, text: option_text)
	end
	redirect "/surveys/#{@survey.id}"
end

delete "/surveys/:survey_id/questions/:id" do 
	@survey = Survey.find(params[:survey_id])
	@question = Question.find(params[:question_id])
	@question.destroy
	redirect "/surveys/#{@survey.id}"
end




