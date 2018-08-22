require_relative 'game'


user_input = ""
while user_input != "q" && user_input != "quit" do
  puts "\n\n**!** Welcome to MASTERMIND **!**\n\n"
  puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  user_input = gets.chomp.downcase
  if user_input == "p" || user_input == "play"
    game = Game.new
    game.play
  elsif user_input == "i" || user_input == "instructions"
    puts "\nTry to guess the random sequence of colors I've chosen. Each time you guess I'll tell you how many colors you have exactly right and how many colors you have right but in the wrong place. Good luck!"
  elsif user_input != "q" && user_input != "quit"
    puts "\nInvalid response, try again."
  else
    puts "\nThanks for playing!\n\n"
  end
end
