require './player'
require './question'

# Set up players
player1 = Player.new
player2 = Player.new

#Set player 1 to go first
player_1s_turn = true;

#Create loop to run the game
while player1.lives_remaining > 0 && player2.lives_remaining > 0

  #Set the current player
  current_player = player_1s_turn ? 1 : 2

  #Ask a question and capture the player's answer
  question = Question.new
  puts "Player #{current_player}: #{question.pose_question}"
  player_answer = gets.chomp.to_i

  #Check the answer and decrease lives if its wrong
  if question.evaluate_answer(player_answer)
    puts "Player #{current_player}: YES! You are correct."
  else
    puts "Player #{current_player}: Seriously? No!"
    current_player == 1 ?
    player1.lives_remaining -=1
    : player2.lives_remaining -=1
  end

  #Print the score
  puts "P1: #{player1.lives_remaining}/3 vs P2: #{player2.lives_remaining}/3"

  #Switch whose turn it is
  player_1s_turn = !player_1s_turn

  #Print new turn only if both players are still in the game (kinda smelly)
  if player1.lives_remaining > 0 && player2.lives_remaining > 0
    puts "----- NEW TURN -----"
  end
end

#Print who won
if player1.lives_remaining > 0
  puts "Player 1 wins with a score of #{player1.lives_remaining}/3"
else
  puts "Player 2 wins with a score of #{player2.lives_remaining}/3"
end

puts "----- GAME OVER -----\n Goodbye!"

