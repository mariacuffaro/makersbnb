require 'sinatra/base'
require './database_connection_setup'
require 'sinatra/activerecord'


current_dir = Dir.pwd
Dir["#{current_dir}/models/*.rb"].each { |file| require file }

class MakersBnb <  Sinatra::Base

  get '/' do

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
  end
