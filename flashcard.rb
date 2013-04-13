class Flashcard
  attr_accessor :question, :answer, :attempts
  
  def initialize(card, attempts = 0)
    @question, @answer = card
    @attempts = attempts
  end
end

