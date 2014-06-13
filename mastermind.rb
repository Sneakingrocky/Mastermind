
#human gives computer answer>computer calculates the score between its guess and the answer

#Separates matches and near matches for computer


def score(color1, color2)
  matches = 0
  near_matches = 0
  color1 = color1.dup #copying arrays to save from .delete(" ") method
  color2 = color2.dup

  for i in 0..3
    if color1[i] == color2[i]
      matches = matches + 1
      color1[i] = " "
      color2[i] = " "

    end
  end

  color1.delete(" ")
  color2.delete(" ")

  color1.each do |peg1|
    color2.each_with_index do |peg2, i|
      if peg1 == peg2
        near_matches = near_matches + 1
        color2.delete_at(i)

        break

      end
    end
  end
  return [matches, near_matches]
end

#Sets number of rounds the computer has to guess the correct # to 10
#Computer starts at "1122" for an optimal guess


puts "Can I have your secret color code?"
secret_color_code = gets.chomp.chars # chomp deletes new line and chars returns as an array


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
  puts "My guess is #{possibilities[0]}"
end
