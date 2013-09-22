class Card < ActiveRecord::Base
  has_many :guesses
  belongs_to :deck

def check_answer(user_answer)
  self.answer.downcase == user_answer.downcase
end



end
