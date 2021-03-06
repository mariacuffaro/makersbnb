require 'sinatra'
require 'rake'
require 'sinatra/activerecord/rake'
require './database_connection_setup.rb'
require 'sinatra/flash'
require 'bcrypt'
require 'date'
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
      session[:user_id] = @user.id
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
      if params['start_date'] == nil
        Space.create(name: "#{params['name']}",
          description: "#{params['description']}",
          price: "#{params['price_per_night']}",
          available_from: "#{params['available_from']}",
          available_to: "#{params['available_to']}")
          @spaces = Space.all.order(created_at: :desc)
        else
          end_date = Date.parse(params[:end_date])
          start_date = Date.parse(params[:start_date])
          @spaces = Space.where("available_from <= :start_date  AND available_to >= :end_date",
            :start_date => start_date,
            :end_date => end_date)
          end
          erb :spaces
        end

        get '/spaces/new' do

         if  session[:user_id] == nil
           redirect '/login'
         end
         erb :spaces_new
       end



        get '/spaces/:id' do
          @space = Space.find_by(id: params[:id])

          erb :selected_space
        end

        post  '/requests' do
          p user_id  = session[:user_id]
          Booking.create(users_id: "#{user_id}",
                        spaces_id: "#{params[:space_id]}")
          redirect '/requests'
        end

        get '/requests' do
          p @bookings = Booking.all()
          erb :managing_requests
        end


        run! if app_file == $0
      end
