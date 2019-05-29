require 'sinatra/base'

class Battle < Sinatra::Base
  enable :sessions 

  get '/' do
    erb(:index)
  end

  get '/play' do
    erb(:play)
  end

  post '/names' do 
    session[:player_one] = params[:PlayerOne]
    session[:player_two] = params[:PlayerTwo]
    redirect '/play'
  end

  run! if app_file == $0
 end