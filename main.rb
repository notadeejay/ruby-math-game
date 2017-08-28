require_relative 'player'
require_relative 'question'

class Game 
  
  @turn = 0
  @end = false
  
  puts "Get ready to play TwO-OPlayer-Math-Game"
  puts

  print 'Player 1, please enter your name: '
  @username = gets.chomp
  player_one = Player.new(@username)

  print 'Player 2, please enter your name: '
  @username = gets.chomp
  player_two = Player.new(@username)

  puts
  puts "Alright then, let's get started!"
  puts
  
  #While @end = false continue asking questions
  while !@end

    if @turn == 0
        print "#{player_one.name}: "
    else 
        print "#{player_two.name}: "
    end
      
    #Initialize a new question
    the_question = Question.new
    puts the_question.ask

    #Collect the users input
    @player_answer = gets.chomp.to_i
    
    #Main game loop
    if @turn == 0 && the_question.is_correct?(@player_answer)
      puts "Nice one, #{player_one.name}!"
      @turn += 1
    elsif @turn == 0 && !the_question.is_correct?(@player_answer)
      puts "You'll get 'em next time #{player_one.name}'"
      player_one.wrong_answer
      @turn += 1
    elsif @turn == 1 && the_question.is_correct?(@player_answer)
      puts "Nice one, #{player_two.name}!"
      @turn -= 1
    elsif @turn == 1 && !the_question.is_correct?(@player_answer)
      puts "You'll get 'em next time #{player_two.name}'"
      player_two.wrong_answer
      @turn -= 1 
    end
   
    #Print score after ever turn
    puts "*** CURRENT SCORE: ***"
    puts "#{player_one.name}: #{player_one.lives}/3 vs. #{player_two.name}: #{player_two.lives}/3"
    puts "---------- NEW TURN ----------"

    #Check if either player has lives remaining 
    if player_one.game_over? || player_two.game_over?
      puts "Game OVER."
      @end = true
      if player_one.lives < 1
        puts "The winner is #{player_two.name}"
      elsif player_two.lives < 1
        puts "The winner is #{player_one.name}"
    end

  end

 end

end