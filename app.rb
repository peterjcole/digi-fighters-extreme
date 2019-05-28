require 'sinatra'

get '/' do
 "Hello"
end

get '/secret' do
  "Santa is real and in the country"
end

get '/public' do
  "<h1>Hello</h1>"
end

get '/random-cat' do
  @name = %w[Ironman Superman Woman goingtokillyou].sample
  erb(:bindex)
end

get '/named-cat' do
  @name = params[:name]
  erb(:bindex)
end