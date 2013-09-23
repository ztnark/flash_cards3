 require 'csv'
'states.csv'

@deck = Deck.create(name: "AbrStates")

CSV.foreach('/Users/apprentice/Dropbox/DBC-Chicago/Fireflies/KEVIN_B/Phase2/Week1/Day5/Flashcards4/db/abrstates.csv', headers: true, header_converters: :symbol) do |row|
  @deck.cards << Card.create(question: "What is the abbreviation for the state of #{row[:state]}?", answer: row[:abbreviation])
end
