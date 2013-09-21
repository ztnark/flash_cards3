# GET ====================================================

get '/welcome' do
   if !session[:id].nil?
    @decks = Deck.all 
    erb :welcome
  else
    redirect '/login'
  end
end
    # if card_count == 0
    #   @game.deck.errors.[:base] = "This deck has no cards.."
    #   erb :welcome
    # elsif card_number < card_count

get '/game/:id' do
  if !session[:id].nil?
    @game = Game.create(deck_id: params[:id], user_id: session[:id])
    @card = @game.deck.cards.first
    if @card == nil
      @game.deck.errors[:base] = "This deck has no cards.."
      erb :welcome
    else
      erb :question
    end
  else
    redirect '/login'
  end
end

get '/game/question/:id' do
  if !session[:id].nil?
    @game = Game.find(params[:id])
    id_array = @game.deck.cards.find(:all).map(&:id)
    card_number = @game.guesses.all.count
    card_count = @game.deck.cards.count
    if card_number < card_count
      @card = Card.find(id_array[card_number])
      erb :question
    else
      redirect "/results/#{session[:id]}"
    end
  else
    redirect '/login'
  end
end


get '/answer/:game_id/:card_id/:correct' do
  if !session[:id].nil?
    @game = Game.find(params[:game_id])
    @correct = params[:correct]
    @card = Card.find(params[:card_id])
    erb :answer
  else
    redirect '/login'
  end
end


# POST ===================================================

post '/card/:game_id/:card_id' do
  if !session[:id].nil?
    @card = Card.find(params[:card_id])
    answer = params[:answer]
    correct = @card.check_answer(answer)
    Guess.create(response: correct, card_id: params[:card_id], game_id: params[:game_id])
    redirect "/answer/#{params[:game_id]}/#{@card.id}/#{correct}"
   else
    redirect '/login'
  end
end
# @game.deck.cards.each {|card| @array << Guess.create(card_id: card.id, round_id: @game.id)}
  
