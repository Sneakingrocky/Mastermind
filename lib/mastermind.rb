class Mastermind

  COLORS = ["r", "o", "y", "g", "b", "p"]

  def play_game
    display_game_rules
    prompt_for_code
    game_loop 
    display("I lose. At least I still have my good looks.")
  end

  private 

  def possibilities
    @possibilities ||= COLORS.repeated_permutation(4).to_a
  end  


  def display_game_rules
    display("Choose a combination of 4 colors for your secret code! You can choose from #{COLORS.join} and duplicates are allowed.")
  end

  def prompt_for_code
    display("Can I have your secret code?")
    @secret_color_code = gets.chomp.chars
    validate_secret_color_code
  end

  def validate_secret_color_code
    unless valid_secret_color_code?
      display("That is an invalid code, please choose a combination of 4 colors from from #{COLORS.join}. Duplicates are allowed.")
      prompt_for_code
    end
  end  

  def valid_secret_color_code?
    @secret_color_code.length == 4 &&
      @secret_color_code.all? { |char| COLORS.include?(char) }
  end

  def get_ai_guess
    possibilities[0] 
  end

  def game_loop
     10.times do |round|
      display("This is round #{round}")
      play_round
    end
  end

  def check_for_winning_code(matches)
    if matches == 4
      display("I did it! I am so smart.")
      exit
    end
  end  

  def play_round
    ai_guess = get_ai_guess
    display("My guess is #{ai_guess.join}")
    score = Score.compare(@secret_color_code, ai_guess)
    check_for_winning_code(score.matches) 
    process_feedback(ai_guess, score)      
  end

  def process_feedback(ai_guess, score)
    possibilities.delete_if do |possibility|
      new_score = Score.compare(possibility, ai_guess)
      score != new_score
    end
  end  

  def display(message)
    puts(message)
  end
end
