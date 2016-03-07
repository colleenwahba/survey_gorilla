get '/users/new' do
    erb :register
end

post '/users/new' do
  @user = User.create(email: params[:email], password: params[:password_plaintext])
    session[:user_id] = @user.id
    redirect '/home'
end
