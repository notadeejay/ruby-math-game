class Player
  
  attr_accessor :name, :lives 

  def initialize (name)
    @name = name
    @lives = 3
  
  end
 
  def wrong_answer
    @lives -=1
  end

  def game_over? 
    @lives < 1
  end

end