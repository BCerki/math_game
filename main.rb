require 'pp'
require './player'
require './question'

player1 = Player.new
p player1
player2 = Player.new
p player2

player_1s_turn = true;
current_player = player_1s_turn ? 1 : 2
# puts player_1s_turn
# puts current_player

question = Question.new
puts "Player #{current_player}: #{question.pose_question}"
user_answer = gets.chomp.to_i
if question.evaluate_answer(user_answer)
  puts "Player #{current_player}: YES! You are correct."
else
  puts "Player #{current_player}: Seriously? No!"
  player1.lives_remaining -=1
end
puts "P1: #{player1.lives_remaining}/3 vs P2: #{player2.lives_remaining}/3"

if player1.lives_remaining > 0 && player2.lives_remaining > 0
  puts "----- NEW TURN -----"
  player_1s_turn = !player_1s_turn
else
  if player1.lives_remaining
    puts "Player 1 wins with a score of #{player1.lives_remaining}/3"
  else "Player 2 wins with a score of #{player2.lives_remaining}/3"
  end
  puts "----- GAME OVER -----"
end
