
class Player
attr_accessor :number, :lives_remaining

  def initialize(number)
    @number = "Player #{number}"
    @lives_remaining = 3
  end

  def reduce_lives
    @lives_remaining -= 1
  end
end

