
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
      @user_session_model.repeat_flashcard_database << @current_card 
      return "BOOOOO! Google it next time."
    end
  end

  def get_next_question 
    @current_card = @user_session_model.get_next_question
    @current_card.question
  end

  def first_deck_finished?
    @user_session_model.flashcard_database.empty? ? true : false
  end

  def repeat_deck_finished?
    @user_session_model.repeat_flashcard_database.empty? ? true : false
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
    until @controller.first_deck_finished?
      questions_answers
    end
    until @controller.repeat_deck_finished?
      questions_answers
    end
    puts "finished! Good work!"
  end

  def welcome
    puts "-------------------------------"
    puts "Welcome to the Flash Card Game"    
    puts "-------------------------------"
  end

  def choose_decks_prompt
    puts "which card game do you want play?"
    print "> "
    input = gets.chomp
    puts @controller.respond_to_decks(input.to_i)
  end

  def questions_answers
    system  "clear"
    until @controller.first_deck_finished? && @controller.repeat_deck_finished?
      puts @controller.get_next_question
      print "> "
      input = gets.chomp
      puts @controller.respond_to_q_a(input)
      sleep(0.5)
      system "clear"
    end
  end
end


user_session_model = UserSessionModel.new
flash_controller = FlashCardController.new(user_session_model)
new_game = FlashCardView.new(flash_controller)
new_game.start
