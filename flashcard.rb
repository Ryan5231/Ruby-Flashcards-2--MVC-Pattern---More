class Flashcard
  attr_accessor :question, :answer, :attempts
  
  def initialize(question, answer, attempts)
    @question = question
    @answer = answer 
    @attempts = attempts
  end
end

