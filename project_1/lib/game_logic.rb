class GameLogic
  attr_accessor :computer_sequence,
                :player_guess,
                :guess_counter

  attr_reader   :time_start

  def initialize
    @computer_sequence = []
    @player_guess = []
    @guess_counter = 0
  end

  def start_time
    @time_start = Time.new.to_i
  end

  def computer_random_generator
    if @computer_sequence == []
      color_options = ["r", "g", "b", "y"]
      start_time
      4.times do
        @computer_sequence << color_options.sample
      end
    end
  end

  def introductory_text
   "Welcome to MASTERMIND\n Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def player_path_decider
    puts introductory_text
    initial_player_input = gets.chomp.downcase
    if initial_player_input == "p" || initial_player_input == "play"
      return
    elsif initial_player_input == "i" || initial_player_input == "instructions"
      puts instructions
      player_path_decider
    elsif initial_player_input == "q" || initial_player_input == "quit"
      exit
    else
      player_path_decider
    end
  end

  def instructions
    "The computer will generate a random sequence of 4 colors: (r)ed, (g)reen, (b)lue, and (y)ellow. There can be duplicates!\n You will make guesses in the format: rygb.\n You can quit at any time by pressing (q) or typing quit! During gameplay, you can cheat too... by typing (c) or cheat. :("
  end

  def game_play_instructions
    "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
  end

  def try_again_text
    "Try again!"
  end

  def just_give_up
    "Maybe this game isn't for you."
  end

  def get_player_guess
    if @guess_counter == 0
      puts game_play_instructions
    elsif @guess_counter > 10
      puts just_give_up
    elsif @guess_counter >= 1
      puts try_again_text
    end
    player_color_guess = gets.downcase.chomp
    if player_color_guess == "q" || player_color_guess == "quit"
      exit
    elsif player_color_guess == "c" || player_color_guess == "cheat"
      puts @computer_sequence.join
      get_player_guess
    elsif invalid_guess?(player_color_guess)
      get_player_guess
    else
      @player_guess = player_color_guess.split("")
    end
  end

  def invalid_guess?(player_color_guess)
    if player_color_guess.length == @computer_sequence.length
      return false
    elsif player_color_guess.length > @computer_sequence.length
      puts "Too many colors!"
      return true
    elsif player_color_guess.length < @computer_sequence.length
      puts "Not enough colors!"
      return true
    end
  end

  def exact_elements
    exact_element_counter = 0
    @computer_sequence.each_with_index do |color, i|
      exact_element_counter += 1 if color == @player_guess[i]
    end
    exact_element_counter
  end

  def like_elements
    like_element_counter = 0
    cloned_computer_sequence = @computer_sequence.clone
    @player_guess.each do |color|
      if cloned_computer_sequence.include?(color)
        delete_color = cloned_computer_sequence.index(color)
        cloned_computer_sequence.delete_at(delete_color)
        like_element_counter += 1
      end
    end
    like_element_counter
  end

  def guess_counter
    if did_player_win? == false
      @guess_counter += 1
    end
    @guess_counter
  end

  def incorrect_guess_statement
    if did_player_win? == false
      "#{@player_guess.join("")} has #{like_elements} of the correct elements with #{exact_elements} in the correct positions. Number of guesses: #{@guess_counter}."
    end
  end

  def did_player_win?
    @player_guess == @computer_sequence
  end

  def time_spent_playing
    total_time_played = Time.now.to_i - @time_start
    "It took you #{total_time_played / 60} minutes and #{total_time_played % 60} seconds to finish!"
  end

  def win_state_text
    "You guessed correctly! It only took you... uh... #{@guess_counter} guesses."
  end

  def play_again_text
    "Do you want to (p)lay again or (q)uit?"
  end

  def reset_computer_input
    @computer_sequence = []
  end

  def win_state
    if did_player_win? == true
    @guess_counter += 1
    puts win_state_text
    puts time_spent_playing
    @guess_counter = 0
    puts play_again_text
    loop do
      play_again_or_quit = gets.chomp.downcase
      if play_again_or_quit == "p" || play_again_or_quit == "play"
        break
      elsif play_again_or_quit == "q" || play_again_or_quit == "q"
        exit
      end
    end
    reset_computer_input
    puts `clear`
  end
end
end
