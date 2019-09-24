require 'sinatra'
require 'rake'
require 'sinatra/activerecord/rake'
require_relative 'database_connection_setup.rb'
require 'sinatra/flash'
require './lib/user.rb'


class Makersbnb < Sinatra::Base
enable :sessions

  get '/' do
    erb :index
  end

  post '/signup' do
    User.create(first_name: "#{params['first_name']}",
      last_name: "#{params['last_name']}",
      email: "#{params['email']}",
      password: "#{params['password']}")

    redirect('/login')
  end

  get '/login' do
    erb :login
  end

  post '/login' do

  user = User.find_by_email(params[:email])
  if(user && user.authenticate(params[:password]))
    session[:user_id] = user.id
  redirect('/spaces')
else
  redirect('/')
  end
end

  get '/spaces' do
    @first_name = session[:first_name]
    erb :spaces
  end

run! if app_file == $0
end
