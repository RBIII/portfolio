require 'sinatra'

get '/' do
  erb :projects
end

get '/about' do
  erb :about
end

get '/contact' do
  erb :contact
end
