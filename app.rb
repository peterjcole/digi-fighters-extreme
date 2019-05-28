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

get '/cat' do
  "<img src=\"http://f.cl.ly/items/0k0v3e2X3l2f3i1n1Y19/Screen%20Shot%202013-09-10%20at%2011.32.00.png\" style=\"border: medium dashed pink\">"
end