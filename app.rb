require 'sinatra'
require 'rake'
require 'sinatra/activerecord/rake'
require './database_connection_setup.rb'
require 'sinatra/flash'
require './lib/user.rb'

current_dir = Dir.pwd
Dir["#{current_dir}/models/*.rb"].each { |file| require file }

class MakersBnb < Sinatra::Base
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
 p params

 p user = User.find_by(email: 'neildcampbell@hotmail.com')

"I'm here"
end

get '/spaces' do
 @spaces = Space.all.order(created_at: :desc)
 erb :spaces
end

post '/spaces' do
   Space.create(name: "#{params['name']}",
     description: "#{params['description']}",
     price: "#{params['price_per_night']}",
     available_from: "#{params['available_from']}",
     available_to: "#{params['available_to']}")
     @spaces = Space.all.order(created_at: :desc)
     erb :spaces
   end
   get '/spaces/new' do
        erb :spaces_new
      end

run! if app_file == $0
end
