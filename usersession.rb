require_relative 'reader'



class UserSessionModel
  attr_reader :flashcard_database

  def load(filename)
    @flashcard_database = Reader.read(filename)
  end

  def shuffle
    @flashcard_database.shuffle
  end

  def add_to_failed

  end

  def validate
    #this returns a boolean

  end

end

# session_instance = UserSessionModel.new("flashcard_sample.txt")
# p session_instance
