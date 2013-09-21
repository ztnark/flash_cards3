class Card < ActiveRecord::Base
  has_many :guesses
  belongs_to :deck

def check_answer(user_answer)
  self.answer == user_answer
end



end
