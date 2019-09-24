require 'sinatra/base'

class MakersBnb <  Sinatra::Base

get '/' do

end

get '/spaces' do
  erb :spaces
end

get '/spaces/new' do
redirect '/'
end


end
