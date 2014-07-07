class Mastermind
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
    gets.chomp.chars
  end

  def play_game
    secret_color_code = prompt_for_code

    #permutation of possible guesses
    colors = ["r", "o", "y", "g", "b", "p"]
    possibilities = colors.repeated_permutation(4).to_a

    #Computers guess
    guess = ["r", "r", "o", "o"]
    puts "My guess is rroo!"

    10.times do |round|
      puts "This is round #{round}"
      matches, near_matches = score(secret_color_code, guess)

      if matches == 4
        puts "I did it! I am so smart."
        break #to stop loop
      elsif round == 9
        puts "I lose. At least I still have my good looks."
        break #to stop loop
      end

      possibilities.delete_if do |possibility|
        new_matches, new_near_matches = score(possibility, guess)
        [matches, near_matches] != [new_matches, new_near_matches]
      end

      guess = possibilities[0] #this is guessing the first possibility
      puts "My guess is #{guess}"
    end
  end
end

Mastermind.new.play_game
