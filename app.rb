require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions 

  get '/' do
    erb(:index)
  end

  get '/play' do
    erb(:play)
  end

  post '/names' do 
    player_one = Player.new(params[:PlayerOne])
    player_two = Player.new(params[:PlayerTwo])
    $game = Game.new(player_one, player_two)
    redirect '/play'
  end

  post '/attack' do
    $game.attack(:player_two)
    redirect '/attack'
    
  end

  get '/attack' do
    erb(:attack)
  end

  run! if app_file == $0
end
