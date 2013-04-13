class Flashcard
  attr_accessor :question, :answer, :attempts
  
  def initialize(card, correct_attempts = 0, incorrect_attempts = 0)
    @question, @answer = card
    @correct_attempts = correct_attempts
    @incorrect_attempts = incorrect_attempts
  end
end

