class CreateGuesses < ActiveRecord::Migration
  def change
      create_table :guesses do |t|
      t.integer :game_id
      t.integer :card_id
      t.boolean :response
    end
  end
end
