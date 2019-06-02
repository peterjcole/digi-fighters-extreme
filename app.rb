require 'sinatra/base'
require './lib/player'

class Battle < Sinatra::Base
  enable :sessions 

  get '/' do
    erb(:index)
  end

  get '/play' do
    erb(:play)
  end

  post '/names' do 
    $player_one = Player.new(params[:PlayerOne])
    $player_two = Player.new(params[:PlayerTwo])
    redirect '/play'
  end

  post '/attack' do
    $player_two.take_hit
    redirect '/attack'
    
  end

  get '/attack' do
    erb(:attack)
  end
  
  run! if app_file == $0
end
