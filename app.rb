require_relative 'secrets'
require 'sinatra'
require 'sqlite3'
require 'stripe'
Stripe.api_key = $STRIPE_SECRET_TEST_KEY


get '/' do
  # connect to the database
  db = SQLite3::Database.open('store.db')

  # configure results to be returned as as an array of hashes instead of nested arrays
  db.results_as_hash = true

  # query the products table and print the result
  puts "Database query results:"
  @products = db.execute("SELECT id, description, price FROM products;")  
  p @products
  # close database connection
  db.close
  @crazyTest = "This is a crazy test"
  erb :home
end

get '/success' do
  "Your payment has processed  #{params[:cardNumber] ? "with #{params[:cardNumber]}" : ""} successfully"
end

post '/pay' do 
  p "The data is sent here #{params}"
  p params
  db = SQLite3::Database.open('store.db');
  @amount = db.execute("SELECT price FROM products WHERE id=#{params[:selectedProduct]}");
  p @amount;
  redirect "/success"
end

