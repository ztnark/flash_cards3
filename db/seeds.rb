 require 'csv'

Deck.create(name: "States")
    CSV.foreach('public/states.csv', headers: true, header_converters: :symbol) do |row|
      Card.create(question: row[:question], answer: row[:answer], deck_id: row[:deck_id].to_i)
    end
