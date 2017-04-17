require 'sinatra'
require 'pry'
require 'mailgun'

get '/' do
  erb :projects
end

get '/about' do
  erb :about
end

get '/contact' do
  erb :contact
end

post '/contact' do
  binding.pry
  mg_client = Mailgun::Client.new 'key-71aa3089c30f441a714c68fd8fef910d'

  message_params = { from: 'robertbasso2@gmail.com',
                    to:   'robertbasso2@gmail.com',
                    subject: 'The Ruby SDK is awesome!',
                    text:    'It is really easy to send a message!'
                    }
  binding.pry
  mg_client.send_message 'gmail.com', message_params
  binding.pry
end
