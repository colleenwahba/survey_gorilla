get '/' do
  erb :index
end

get '/secret' do
  redirect '/sessions/new' unless session[:user_id]
  "Secret area!"
end

get '/home' do
  @user = User.find(session[:user_id])
  # @surveys = Survey.find_by(owner_id: session[:user_id])
  @surveys = Survey.all
  erb :home
end

# get '/instrux' do 
# 	erb :instrux
# end
