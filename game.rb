require './player'
require './question'

class Game

  def initialize
    @player1 = Player.new(1)
    @player2 = Player.new(2)
    @current_player = nil
    @winner = nil
  end

  def set_current_player
    if @current_player == nil
      @current_player = @player1
    elsif @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def ask_question
    @question = Question.new
      puts "#{@current_player.number}: #{@question.pose_question}"
      @player_answer = gets.chomp.to_i
  end

  def print_response
    if @question.evaluate_answer(@player_answer)
      puts "#{@current_player.number}: YES! You are correct."
    else
      puts "#{@current_player.number}: Seriously? No!"
      @current_player.reduce_lives
    end
  end

  def print_score
    puts "P1: #{@player1.lives_remaining}/3 vs P2: #{@player2.lives_remaining}/3"
  end

  def check_for_winner
    if @player1.lives_remaining > 0 && @player2.lives_remaining > 0
      puts "----- NEW TURN -----"
    else
      if @player1.lives_remaining == 0
        @winner = @player2
      else
        @winner = @player1
      end
      puts "#{@winner.number} wins with a score of #{@winner.lives_remaining}/3"
      puts "----- GAME OVER -----\n Goodbye!"
    end
  end

  def run_game

    while @player1.lives_remaining > 0 && @player2.lives_remaining > 0

      #Set the current player
      set_current_player

      #Ask a question and capture the player's answer
      ask_question

      #Check the answer and decrease lives if its wrong
      print_response

      #Print the score
      print_score

      check_for_winner

    end
  end
end
