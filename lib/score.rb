class Score
  attr_reader :matches, :near_matches

	def self.compare(secret_code, ai_guess)
    score = new(secret_code, ai_guess)
    score.calculate_score
    score
  end

  def initialize(secret_code, ai_guess)
    @matches = 0
    @near_matches = 0
    @secret_code = secret_code.dup
    @ai_guess = ai_guess.dup
  end

  def calculate_score
    calculate_matches
    calculate_near_matches
  end

  private

  def calculate_matches
    @secret_code.each_with_index do |color, index|
      if color == @ai_guess[index]
        @matches += 1
        @secret_code[index], @ai_guess[index] = " ", " "
      end
    end
   
    @secret_code.delete(" ")
    @ai_guess.delete(" ")
  end

  def calculate_near_matches
    @secret_code.each do |peg1|
      @ai_guess.each_with_index do |peg2, index|
        if peg1 == peg2
          @near_matches += 1
          @ai_guess.delete_at(index)

          break

        end
      end
    end
  end

  def ==(other_score)
    matches == other_score.matches &&
      near_matches == other_score.near_matches
  end

end