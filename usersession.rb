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

    return @repeat_flashcard_database

  end

  def validate(input, current_card)
    #this returns a boolean
    current_card.answer == input
  end

  def keep_track_attempts

  end

  def get_next_question
    @flashcard_database.pop
  end

  

end

# session_instance = UserSessionModel.new("flashcard_sample.txt")
# p session_instance
