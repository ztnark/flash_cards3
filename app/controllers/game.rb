# GET ====================================================

get '/welcome' do
  @decks = Deck.all
  erb :welcome
end

get '/game/:id' do
  @game = Game.create(deck_id: params[:id], user_id: session[:id])
  # id_array = @game.deck.cards.find(:all).map(&:id)
  # @game.guesses
  @card = @game.deck.cards.first
  # @i+=1
  # id_array[0]
  erb :question
end

get '/game/question/:id' do
  @game = Game.find(params[:id])
  id_array = @game.deck.cards.find(:all).map(&:id)
  card_number = @game.guesses.all.count
  card_count = @game.deck.cards.count
  if card_number < card_count
    @card = Card.find(id_array[card_number])
    erb :question
  else
    redirect '/'
  end
end


get '/answer/:game_id/:card_id/:correct' do
  @game = Game.find(params[:game_id])
  @correct = params[:correct]
  @card = Card.find(params[:card_id])
  erb :answer
end


# POST ===================================================

post '/card/:game_id/:card_id' do
  @card = Card.find(params[:card_id])
  answer = params[:answer]
  correct = @card.check_answer(answer)
  Guess.create(response: correct, card_id: params[:card_id], game_id: params[:game_id])
  redirect "/answer/#{params[:game_id]}/#{@card.id}/#{correct}"
end
# @game.deck.cards.each {|card| @array << Guess.create(card_id: card.id, round_id: @game.id)}
  
