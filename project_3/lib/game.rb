class Game
  attr_reader :answer

  def initialize
    @answer = ("rgby"*4).chars.sample(4).join.to_s
  end

  def play
    puts "\nI have generated a sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. No (c)heating!"
    num_guesses = 0
    time = Time.now
    loop do
      puts "What's your guess?"
      user_guess = gets.chomp.downcase
      num_guesses += 1
      if user_guess == "q" || user_guess == "quit"
        quit
        break
      elsif user_guess == "c" || user_guess == "cheat"
        puts "\nThe correct answer is #{@answer}."
      elsif (user_guess.chars - ("rgby".chars)) != []
        puts "\nInvalid guess: use only the letters r, g, b, or y."
      elsif user_guess.length < 4
        puts "\nToo short, guess again. "
      elsif user_guess.length > 4
        puts "\nToo long, guess again. "
      elsif user_guess == @answer
        winner(num_guesses, time)
        break
      else
        compare(user_guess)
      end
      puts "You've taken #{num_guesses} guess(es)."
    end
  end

  def quit
    puts "\nSee ya later, quitter! \n\n"
  end

  def winner(num_guesses, time)
    minutes = ((Time.now - time)/60).to_i
    seconds = ((Time.now - time) % 60).to_i
    puts "\nCongratulations! You guessed the sequence '#{@answer}' in #{num_guesses} guess(es) over #{minutes} minutes, #{seconds} seconds. \n\n"
  end

  def compare(user_guess)
    user_guess_array = user_guess.chars
    correct_colors = 0
    @answer.chars.each do |a|
      if user_guess_array.include?(a)
        correct_colors += 1
        user_guess_array.slice!(user_guess_array.index(a))
      end
    end
    correct_indexes = @answer.chars.zip(user_guess.chars).count do |a, u|
      a == u
    end
    puts "\n'#{user_guess}' has #{correct_indexes} correct color(s) in the correct place and #{correct_colors - correct_indexes} correct color(s) in the wrong place."
  end

end
