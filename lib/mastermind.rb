class Mastermind

  COLORS = ["r", "o", "y", "g", "b", "p"]

  def initialize
    @possibilities = create_possibilities
  end


  def play_game
    prompt_for_code
    game_loop 
    display("I lose. At least I still have my good looks.")
  end

  private 

  def create_possibilities
    COLORS.repeated_permutation(4).to_a
  end  

  #Sets number of rounds the computer has to guess the correct # to 10
  def prompt_for_code
    display("Can I have your secret code?")
    @secret_color_code = gets.chomp.chars
  end

  def get_ai_guess
    @possibilities[0] #this is guessing the first possibility
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
    @possibilities.delete_if do |possibility|
      new_score = Score.compare(possibility, ai_guess)
      score != new_score
    end
  end  

  def display(message)
    puts(message)
  end
end
