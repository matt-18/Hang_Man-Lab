puts "Welcome to Hangman?"
words = %w"pencilcase jolly jeans computer sweater sneaker color white television class clock earth search database telephone kilogram walk locker machine screen master earth starting settings apple morning night afternoon octagon circle container coffee weight trash hangman"
total_chances = 5
number_incorrect = 0
right_guess = ' '

survived = <<WIN
 0    0


|      |
 |____|
WIN

word = words[rand(words.length) - 1]

def get_placeholder sample_word, guessed_words
  placeholder = ' '
  sample_word.chars {|char|
    placeholder += (guessed_words.include? char)? char : '#'
  }
  placeholder
end

puts 'Guess what the word is:' + get_placeholder(word, '')

while true
  print "Enter letter (lowercase only) [#{total_chances - number_incorrect} chances left]"

  char = gets.chomp

  if word.include? char

    if (right_guess.include? char)
      puts char + ' is already given and accepted.'
      puts "Try another: " + get_placeholder(word, right_guess)
    else
      right_guess = right_guess + char
      placeholder = get_placeholder(word, right_guess)

      puts 'Great! Your letter was in the word!' + placeholder
    end
    unless placeholder.include? '#'
      puts "Well Done! You Survived!"
      puts survived
      break
    end
  else
    puts "Sorry! The word doesn't contain '#{char}'"
    number_incorrect + 1
    number_incorrect += 1
    if number_incorrect == 0
      puts "   ______    "
    end

    if number_incorrect == 1
      puts "   ______    "
      puts '         |         '
    end

    if number_incorrect == 2
      puts "   ______    "
      puts '         |         '
      puts "         O         "
    end

    if number_incorrect == 3
      puts "   ______    "
      puts '         |         '
      puts "         O         "
      puts '        /|\          '
    end

    if number_incorrect == 4
      puts "   ______    "
      puts '         |         '
      puts "         O         "
      puts '        /|\          '
      puts "         |         "
    end

    if number_incorrect == 5
      puts "   ______    "
      puts '         |         '
      puts "         O         "
      puts '        /|\          '
      puts "         |         "
      puts '        / \           '
    end

    if (number_incorrect == total_chances)
      puts "Sorry, you were hanged. :("
      break
    else
      puts 'Try another : ' + get_placeholder(word, right_guess)
    end
  end
end


puts "The word was " + word
