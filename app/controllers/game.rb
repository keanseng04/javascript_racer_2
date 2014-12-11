require 'securerandom'
set :protection, except: :session_hijacking

post '/game' do
  @player1 = Player.find_or_create_by_name(params[:p1])
  @player2 = Player.find_or_create_by_name(params[:p2])
  @game = Game.create(url: SecureRandom.hex(3), done: false)
  session[:player1] = @player1
  session[:player2] = @player2
  session[:game_id] = @game.id
  redirect to ("/game/#{@game.id}")
end

get '/game/:id' do
  @game = Game.find(params[:id])
  @player1 = session[:player1]
  @player2 = session[:player2]
  round_p1 = Round.create(game: @game, player: @player1)
  round_p2 = Round.create(game: @game, player: @player2)
  erb :game
end


post '/finish' do
  @game = Game.find(session[:game_id])
  @game.update_attributes(done: true, winner: params["winner"], total_time: params["time"])
  @message = params["winner"] << " WON with time " << params["time"] << " second(s)."
  erb :finish
end

post '/url/:url' do
  @game = Game.find(session[:game_id])
  erb :gameurl
end