require 'sinatra'

get '/' do
  "This is the home page."
end

get '/success' do
  p params
  "Your payment has processed  #{params[:cardNumber] ? "with #{params[:cardNumber]}" : ""} successfully"
end