require_relative 'player'
require_relative 'question'

class Game 
  
  @turn = 0
  @end = false
  
  puts "Welcome to TwO-OP-Math-Game(Ruby Edition)"
  puts

  print 'Player 1 name: '
  @username = gets.chomp
  p1 = Player.new(@username)

  print 'Player 2 name: '
  @username = gets.chomp
  p2 = Player.new(@username)


  puts "Alright then, let's get started!"
  puts

while !@end

  case @turn
    when 0
      print "#{p1.name}: "
    else 
      print "#{p2.name}: "
  end
    
    
    question = Question.new
    puts question.ask
    @player_answer = gets.chomp.to_i
    
    if @turn == 0 && question.is_correct?(@player_answer)
      puts "Nice one, #{p1.name}!"
      @turn += 1
    elsif @turn == 0 && !question.is_correct?(@player_answer)
      puts "You'll get 'em next time #{p1.name}'"
      p1.wrong_answer
      @turn += 1
    elsif @turn == 1 && question.is_correct?(@player_answer)
      puts "Nice one, #{p2.name}!"
      @turn -= 1
    elsif @turn == 1 && !question.is_correct?(@player_answer)
      puts "You'll get 'em next time #{p2.name}'"
      p2.wrong_answer
      @turn -= 1 
    end
 
    puts
    puts "#{p1.name}: #{p1.lives}/3 vs. #{p2.name}: #{p2.lives}/3"
    puts "---------- NEW TURN ----------"

    if p1.game_over? || p2.game_over?
      puts "Game OVER."
      @end = true
      if p1.lives < 1
        puts "The winner is #{p2.name}"
      elsif p2.lives < 1
        puts "The winner is #{p1.name}"
    end

  end

 end

end