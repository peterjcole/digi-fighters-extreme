require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions 

  before do
    @game = Game.instance
  end
  
  get '/' do
    erb(:index)
  end

  get '/play' do
    erb(:play)
  end

  post '/names' do 
    player_one = Player.new(params[:PlayerOne])
    player_two = Player.new(params[:PlayerTwo])
    Game.create(player_one, player_two)
    redirect '/play'
  end

  post '/attack' do
    Game.instance.attack_next
    redirect '/attack'
  end

  get '/attack' do
    erb(:attack)
  end

  run! if app_file == $0
end
