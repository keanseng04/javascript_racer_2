require 'securerandom'
set :protection, except: :session_hijacking

get '/' do
  session[:player1] = nil
  session[:player2] = nil
  erb :index
end