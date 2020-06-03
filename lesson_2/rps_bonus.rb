VALID_CHOICES = %w(r p s l sp)

WINNING_HASH = { 'r' => ['s', 'l'],
                 'p' => ['r', 'sp'],
                 's' => ['p', 'l'],
                 'l' => ['sp', 'p'],
                 'sp' => ['s', 'r'] }

CHOICE_CONVERSION = { 'r' => 'rock', 'p' => 'paper', 's' => 'scissors',
                      'l' => 'lizard', 'sp' => 'spock' }

game_number = 1
total_score = { user_score: 0, computer_score: 0 }

system("clear") || system("cls")

def prompt(message)
  puts("\n=> #{message}")
end

def validate_choice(choice)
  VALID_CHOICES.include?(choice)
end

def win?(first, second)
  WINNING_HASH[first].include?(second)
end

def display_winner(player1, player2)
  if win?(player1, player2)
    prompt("You win!")
  elsif win?(player2, player1)
    prompt("Computer wins!")
  else
    prompt("It's a tie")
  end
end

def score(player1, player2, total_score)
  if win?(player1, player2)
    total_score[:user_score] += 1
  elsif win?(player2, player1)
    total_score[:computer_score] += 1
  end
end

def print_champion(points_hash)
  "The score is:
     You: #{points_hash[:user_score]}
     Computer: #{points_hash[:computer_score]}
    -------------"
end

def clear_screen
  system('clear')
end

def continue
  prompt("Enter any key or hit 'Enter' to play the next game.")
  gets
  clear_screen
end

prompt("Welcome to Rock, Paper, Scissor, Lizard, Spock!
   The first player to win 5 games is the champion!")

until total_score.value?(5)

  prompt("#{print_champion(total_score)}
    Game #{game_number}")
  prompt("Please enter your choice
   (r for rock, p for paper, s for scissor, l for lizard, sp for spock)")
  player_choice = ''

  loop do
    player_choice = gets.downcase.chomp
    break if validate_choice(player_choice)
    prompt("Invalid choice please choose either r, s, p, l, or sp.")
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{CHOICE_CONVERSION[player_choice]}
   Computer chose #{CHOICE_CONVERSION[computer_choice]}.")
  display_winner(player_choice, computer_choice)
  score(player_choice, computer_choice, total_score)
  continue
  game_number += 1
end

prompt("GAME OVER! Final Score
   You #{total_score[:user_score]} Computer #{total_score[:computer_score]}
   Thank you for playing! Goodbye!")
