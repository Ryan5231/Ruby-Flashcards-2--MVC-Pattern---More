require_relative 'Reader'

class UserSessionModel
  def initialize(filename)
    @flashcard_database = Reader.read(filename)
  end

  def shuffle
    @flashcard_database.shuffle
  end

  def add_to_failed
# sida zhang
  end

  def validate

  end
end

session_instance = UserSessionModel.new("flashcard_sample.txt")
p session_instance
