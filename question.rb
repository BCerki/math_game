class Question
  def initialize
    @respondant
    @number1 = 5
    @number2 = 6
    @answer
    @response
  end

  def random_number

  end


  def pose_question
    "What does #{@number1} plus #{@number2} equal?"
  end


  def evaluate_answer(user_answer)
    @correct_answer = @number1 + @number2
    user_answer == @correct_answer ? true : false
  end



end
