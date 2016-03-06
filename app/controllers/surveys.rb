require 'pry'

get "/surveys" do
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




