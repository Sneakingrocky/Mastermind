class Mastermind

  COLORS = ["r", "o", "y", "g", "b", "p"]

  def initialize
    @possibilities = COLORS.repeated_permutation(4).to_a
  end

  #Separates matches and near matches for computer
  def score(secret_code, ai_guess)
    matches = 0
    near_matches = 0
    secret_code = secret_code.dup #copying arrays to save from .delete(" ") method
    ai_guess = ai_guess.dup

    for i in 0..3
      if secret_code[i] == ai_guess[i]
        matches += 1
        secret_code[i] = " "
        ai_guess[i] = " "
      end
    end

    secret_code.delete(" ")
    ai_guess.delete(" ")

    secret_code.each do |peg1|
      ai_guess.each_with_index do |peg2, i|
        if peg1 == peg2
          near_matches += 1
          ai_guess.delete_at(i)

          break

        end
      end
    end
    return [matches, near_matches]
  end

  #Sets number of rounds the computer has to guess the correct # to 10
  def prompt_for_code
    puts "Can I have your secret code?"
    @secret_color_code = gets.chomp.chars
  end

  def get_ai_guess
    guess = @possibilities[0] #this is guessing the first possibility
  end

  def play_game
    prompt_for_code 

    10.times do |round|
      puts "This is round #{round}"
      play_round
    end

    puts "I lose. At least I still have my good looks."
  end

  def play_round
    ai_guess = get_ai_guess    
   
    puts "My guess is #{ai_guess.join}"

    matches, near_matches = score(@secret_color_code, ai_guess)

    if matches == 4
      puts "I did it! I am so smart."
      exit
    end

    @possibilities.delete_if do |possibility|
      new_matches, new_near_matches = score(possibility, ai_guess)
      [matches, near_matches] != [new_matches, new_near_matches]
    end
  end

end

Mastermind.new.play_game
