require 'sinatra'

get '/' do
  "This is the home page."
end

get '/success' do
  "Your payment has processed  #{params[:cardNumber] ? "with #{params[:cardNumber]}" : ""} successfully"
end

post '/pay' do 
  p "The data is sent here #{params}"
  p params
  redirect "/success"
end