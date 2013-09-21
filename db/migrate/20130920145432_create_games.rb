class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :deck_id
      t.integer :user_id
      t.integer :total_score, default: 0
    end
  end
end
