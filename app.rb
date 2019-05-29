require 'sinatra/base'

class Battle < Sinatra::Base
  
  get '/' do
    erb(:index)
  end

  post '/' do 
    @player_one = params[:PlayerOne]
    @player_two = params[:PlayerTwo]
    erb(:names)
  end

  run! if app_file == $0
 end