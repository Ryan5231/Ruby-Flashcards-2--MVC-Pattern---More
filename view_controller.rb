
require_relative 'usersession'

class FlashCardController
  def initialize(user_session_model)
    @user_session_model = user_session_model
    @decks = { 1 => 'flashcard_sample.txt', 2 => 'flashcard_sample2.txt', 3 => 'flashcard_sample3.txt'}
  end

  def respond_to_decks(choice)
    filename = @decks[choice]
    @user_session_model.load(filename)
    filename
  end

  def respond_to_q_a(input)
    if @user_session_model.validate(input, @current_card)
      return "AWESOME! Keep it up!"
    else
      return "BOOOOO! Google it next time."
    end
  end

  def get_next_question 
    @current_card = @user_session_model.get_next_question # hack
    @current_card.question
  end

  def game_finished?
    return false
    # return true if it is done
    # otherwise false

  end

  def has_initial_game_finished
    @user_session_model.produce_repeat_list

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
    until @controller.game_finished?
      questions_answers
    end
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
    puts @controller.respond_to_decks(input.to_i)
  end

  def questions_answers
    puts @controller.get_next_question
    input = gets.chomp
    if @controller.respond_to_q_a(input)
      puts "Correct" 
      return true
    else
      puts "Wrong! Try again!"
      return false
    end
  end
end


user_session_model = UserSessionModel.new
flash_controller = FlashCardController.new(user_session_model)
new_game = FlashCardView.new(flash_controller)
new_game.start
