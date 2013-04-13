require_relative 'reader'

class UserSessionModel
  attr_reader :flashcard_database

  def load(filename)
    @flashcard_database = Reader.read(filename)
  end

  def shuffle
    @flashcard_database.shuffle
  end

  def produce_repeat_list
    @repeat_flashcard_database = []
    return @repeat_flashcard_database
  end

  def validate(input, current_card)
    outcome = current_card.answer == input
    keep_track_attempts(outcome, current_card)
    outcome
  end

  def keep_track_attempts(outcome, current_card)
    if outcome
      current_card.correct_attempts += 1
    else
      current_card.incorrect_attempts += 1
      p current_card.incorrect_attempts
    end
  end

  def get_next_question
    @done_database = []
    @done_database << @flashcard_database.pop
    @done_database.last
  end

  

end

# session_instance = UserSessionModel.new("flashcard_sample.txt")
# p session_instance
