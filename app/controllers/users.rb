get '/users/new' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    p session
    redirect "/home"
  else
    erb :register
  end
end

post '/users/new' do
  @user = User.new(email: params[:email], password: params[:password_plaintext])
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :register
  end
end

# get '/users/:id' do
#   @logged_in_as = User.find(session[:user_id]) if session[:user_id]
#   @viewing_user = User.find(params[:id])
#   if @logged_in_as && @logged_in_as.id == @viewing_user.id
#     erb :user
#   else
#     erb :not_authorized
#   end
# end
