class Dummy
  def initialize(arg)
    @question = "question: #{arg}"
    @answer = arg.to_s
  end
end

class UserSessionModel
  # def initialize(filename)
  #   @flashcard_database = Reader.read(filename)
  # end
  def initialize
    @flashcard_database = []
    1.upto(10) { |index| @flashcard_database << Dummy.new(index) }
    @flashcard_database = shuffle
  end

  def shuffle
    @flashcard_database.shuffle
  end

  def add_to_failed

  end

  def validate

  end


end

session_instance = UserSessionModel.new
p session_instance
