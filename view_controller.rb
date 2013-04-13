
require_relative 'usersession'

class FlashCardController
  def initialize(user_session_model)
    @user_session_model = user_session_model
    @decks = { 1 => 'flashcard_sample.txt', 2 => 'flashcard_sample2.txt', 3 => 'flashcard_sample3.txt'}
  end

  def respond_to_decks(choice)
    @user_session_model.load(@decks[choice])
    @decks[choice]
  end

  def respond_to_q_a(input)
    @user_session_model.validate(input, @current_card)
    # calls validate(input)
    # traps user within here if the user keeps getting this wrong
    # return success or failure message
  end

  def get_a_question 
    @current_card = @user_session_model.flashcard_database[0] # hack
    @current_card.question
  end

  def looping
    # respond_to_q_a
    
  end

end


class FlashCardView
  def initialize(controller)
    @controller = controller
  end

  def start
    welcome
    choose_decks_prompt
    game_play
  end

  def game_play
    questions_answers
  end

  def welcome
    puts "-------------------------------"
    puts "Welcome to the Flash Card Game"    
    puts "-------------------------------"
  end

  def choose_decks_prompt
    puts "which card game do you want play?"
    #puts # display all the txt files that are available
    print "> "
    input = gets.chomp
    puts @controller.respond_to_decks(input)
  end

  def questions_answers
    puts "\e[H\e[2J"
    puts @controller.get_a_question
    input = gets.chomp
    puts @controller.respond_to_q_a(input)
  end
end


user_session_model = UserSessionModel.new
flash_controller = FlashCardController.new(user_session_model)
new_game = FlashCardView.new(flash_controller)
new_game.start
