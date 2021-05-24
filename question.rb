class Question
  def initialize
    @number1 = rand(10)
    @number2 = rand(10)
  end

  def pose_question
    "What does #{@number1} plus #{@number2} equal?"
  end

  def evaluate_answer(user_answer)
    @correct_answer = @number1 + @number2
    user_answer == @correct_answer ? true : false
  end
end
