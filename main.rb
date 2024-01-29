require 'sinatra'
require 'rackup'
require 'pry'
require 'mailgun'
require 'sinatra/flash'
enable :sessions

get '/' do
  erb :projects
end

get '/about' do
  erb :about
end

get '/contact' do
  erb :contact
end

get '/resume' do
  erb :resume
end


post '/contact' do
  mg_client = Mailgun::Client.new('key-71aa3089c30f441a714c68fd8fef910d')
  if params[:email].empty?
    flash[:alert] = "Error: email address cannot be empty"
    redirect to('/contact')
  elsif params[:subject].empty?
    flash[:alert] = "Error: subject cannot be empty"
    redirect to('/contact')
  else
    message_params = { from: params[:email],
                      to:   'robertbasso2@gmail.com',
                      subject: params[:subject],
                      text:    params[:message]
                      }
    mg_client.send_message "sandboxcf4d82e7c4ab4d87a0957659241bffbe.mailgun.org", message_params
    flash[:notice] = "Email successfully sent! Thank you for reaching out. I'll be in contact soon."
    redirect to('/contact')
  end
end

# def validate_email(email)
#   url_params = {}
#   url_params[:address] = email
#   query_string = url_params.collect {|k, v| "#{k.to_s}=#{CGI::escape(v.to_s)}"}.
#     join("&")
#   RestClient.get "https://api:key-71aa3089c30f441a714c68fd8fef910d"\
#   "@api.mailgun.net/v3/address/validate?#{query_string}"
# end
