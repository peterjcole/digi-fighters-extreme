require 'sinatra/base'

class Battle < Sinatra::Base
  enable :sessions 

  get '/' do
    erb(:index)
  end

  post '/names' do 
    session[:player_one] = params[:PlayerOne]
    session[:player_two] = params[:PlayerTwo]
    erb(:names)
  end

  run! if app_file == $0
 end