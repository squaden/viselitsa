class Game
  def initialize(slovo)
    @letters = get_letters(slovo)
    @errors = 0
    @good_letters = []
    @bad_letters = []
    @status = 0
  end

  def get_letters(slovo)
    slovo.downcase.split("")
  end

  def status
    @status
  end

  def next_step(bukva)
    if @status == -1 || @status == 1
      return
    end

    if @good_letters.include?(bukva) || @bad_letters.include?(bukva)
      return
    end

    second_letter = ""
    case bukva
    when "е"
      second_letter = "ё"
    when "ё"
      second_letter = "е"
    when "и"
      second_letter = "й"
    when "й"
      second_letter = "и"
    end

    if @letters.include?(bukva) || @letters.include?(second_letter)
      @good_letters << bukva
      if second_letter != ""
        @good_letters << second_letter
      end

      if (@letters - @good_letters).empty?
        @status = 1
      end
    else
      @bad_letters << bukva
      if second_letter != ""
        @bad_letters << second_letter
      end

      @errors += 1

      if @errors >= 7
        @status = -1
      end
    end
  end

  def ask_next_letter
    puts "\nВведите следующую букву"
    letter = ""
    while letter == "" do
      letter = STDIN.gets.chomp
    end

    next_step(letter.downcase)
  end

  def errors
    @errors
  end

  def letters
    @letters
  end

  def good_letters
    @good_letters
  end

  def bad_letters
    @bad_letters
  end
end
