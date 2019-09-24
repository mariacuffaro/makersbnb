require 'sinatra'

class Makersbnb < Sinatra::Base
enable :sessions

  get '/' do
    erb :index
  end

  post '/spaces' do
    session[:first_name] = params[:first_name]
    session[:last_name] = params[:last_name]
    session[:email] = params[:email]
    session[:password] = params[:password]

    redirect('/spaces')
  end

  get '/spaces' do
    @first_name = session[:first_name]
    erb :spaces
  end

run! if app_file == $0
end
