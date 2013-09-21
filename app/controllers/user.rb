############ GET ###################
get "/login" do
  erb :login
end

get '/signup' do
  erb :signup
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/results/:user_id' do
  if !session[:id].nil?
    @user_games = User.find(params[:user_id]).games.all
     erb :results
  else
    redirect '/login'
  end

end



############ POST ###################

post '/signup' do
  @user = User.new(params[:user])
  # @user.password = params[:user][:password]
  @user.save!
  erb :login
end

post '/login' do
  @user = User.authenticate(params[:user][:email], params[:user][:password])
  if @user
    session[:id] = @user.id
    redirect '/welcome'
  else
    redirect '/login'
  end
end


