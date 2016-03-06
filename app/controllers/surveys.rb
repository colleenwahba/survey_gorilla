get "/surveys" do
  @surveys = Survey.all
  erb :"surveys/index"
end

get '/surveys/new' do
	
	erb :'surveys/new'
end

get "/surveys/:id" do
  @survey = Survey.find(params[:id])
  @questions = @survey.questions
  erb :"surveys/show"
end


