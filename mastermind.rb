#TO DO
#Need to program computer to have ability to guess after the first round guess "1122"
#Eliminate possibilies that are not possible
#Assign colors to numbers



#Separates matches and near matches for computer

def score(num1, num2)
  matches = 0
  near_matches = 0

  for i in 0..3
    if num1[i] == num2[i]
      matches = matches + 1
      num1[i] = " "
      num2[i] = " "

    end
  end

  num1.delete(" ")
  num2.delete(" ")

  num1.each do |peg1|
    num2.each_with_index do |peg2, i|
      if peg1 == peg2
        near_matches = near_matches + 1
        num2.delete_at(i)

        break

      end
    end
  end
  return [matches, near_matches]
end

#Sets number of rounds the computer has to guess the correct # to 10
#Computer starts at "1122" for an optimal guess

10.times do |round|
  puts "This is round #{1 + round}"
  puts "My guess is 1122!"

  puts "How many are correct in the correct spot?"
  correct = gets.to_i

  puts "How many are correct in the wrong spot?"
  wrong_spot = gets.to_i

  if correct == 4
    puts "I did it! I'm so smart."
    break
  elsif round == 9
    puts "I lose. At least I have my good looks."
  end
end
