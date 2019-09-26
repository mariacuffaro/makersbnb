require 'sinatra'
require 'rake'
require 'sinatra/activerecord/rake'
require './database_connection_setup.rb'
require 'sinatra/flash'
require 'bcrypt'
# require './lib/user.rb'

current_dir = Dir.pwd
Dir["#{current_dir}/models/*.rb"].each { |file| require file }

class MakersBnb < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  post '/signup' do
    bcrypt_password = BCrypt::Password.create("#{params['password']}")

    User.create(first_name: "#{params['first_name']}",
      last_name: "#{params['last_name']}",
      email: "#{params['email']}",
      password: bcrypt_password)


      redirect('/login')
    end

    get '/login' do

      erb :login
    end

    post '/login' do
      @user = User.find_by(email: "#{params['email']}")
      if BCrypt::Password.new(@user.password) == params['password']
        redirect '/spaces'
      else flash[:notice] = "Credentials Incorrect"
        redirect '/login'
      end
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
