class Mastermind

  COLORS = ["r", "o", "y", "g", "b", "p"]

  def initialize
    @possibilities = create_possibilities
    @matches = 0
    @near_matches = 0
  end

  def create_possibilities
    COLORS.repeated_permutation(4).to_a
  end  

  #Separates matches and near matches for computer
  def score(secret_code, ai_guess)
    reset_matches_and_near_matches
    secret_code, ai_guess = secret_code.dup, ai_guess.dup #copying arrays to save from .delete(" ") method

    secret_code.each_with_index do |color, index|
      if color == ai_guess[index]
        @matches += 1
        secret_code[index], ai_guess[index] = " ", " "
      end
    end
   
    secret_code.delete(" ")
    ai_guess.delete(" ")


    secret_code.each do |peg1|
      ai_guess.each_with_index do |peg2, index|
        if peg1 == peg2
          @near_matches += 1
          ai_guess.delete_at(index)

          break

        end
      end
    end
    return [@matches, @near_matches]
  end

  def reset_matches_and_near_matches
    @matches = 0
    @near_matches = 0
  end

  #Sets number of rounds the computer has to guess the correct # to 10
  def prompt_for_code
    display("Can I have your secret code?")
    @secret_color_code = gets.chomp.chars
  end

  def get_ai_guess
    @possibilities[0] #this is guessing the first possibility
  end

  def play_game
    prompt_for_code
    game_loop 
    display("I lose. At least I still have my good looks.")
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
    matches, near_matches = score(@secret_color_code, ai_guess)
    check_for_winning_code(matches) 
    process_feedback(ai_guess, matches, near_matches)      
  end

  def process_feedback(ai_guess, matches, near_matches)
    @possibilities.delete_if do |possibility|
      new_matches, new_near_matches = score(possibility, ai_guess)
      [matches, near_matches] != [new_matches, new_near_matches]
    end
  end  

  def display(message)
    puts(message)
  end
end
