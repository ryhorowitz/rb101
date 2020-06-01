require "pry"
def prompt(message)
  puts "==> #{message}"
end

prompt("Welcome to the loan calculator!")
prompt("What's your name?")

name = gets.chomp
loop do
  break unless name.empty?
  prompt("Please enter your name.")
end

prompt("Welcome #{name}!")

loop do

  prompt("How much money were you looking to borrow?")
  
  loan = ''
  loop do
    loan = gets.chomp
    if loan == loan.to_i.to_s 
      break
    else
      prompt("You entered an incorrect amount of money. Please enter a whole number. (No '$' sign)")
    end
  end

  prompt("Ok so you want to borrow $#{loan}. What APR would you like? 3% or 5%?")
  
  apr = ''
  loop do
    apr = gets.delete('%').chomp
    if apr == "3" || apr == "5"
      break
    else
      prompt("You entered an incorrect rate. Please select either 3 or 5.")
    end
  end

  prompt("Ok #{name}, you chose #{apr}%. I have one more question: What's the
    term of the loan? (Enter the amount in years)")
  
  term = ''
  loop do
    term = gets.downcase.delete('a-z', ' ').chomp
    if term == term.to_i.to_s
      break
    else
      prompt("Incorrect input. Please enter a number")
    end
  end

  monthly_interest = (apr.to_f / 100) / 12
  length_in_months = term.to_i * 12
  monthly_payment = loan.to_i * (monthly_interest / (1 -
                                  (1 + monthly_interest)**(-length_in_months)))

  total = <<-MSG
  Alright let's calculate your loan...
    #{name} the monthly payment on your loan of $#{loan} will be $#{monthly_payment.round(2)}.

  MSG

  prompt(total)
  prompt("If you would like to calculate another loan please enter 'Yes'.")
  answer = gets.chomp

  break unless answer.downcase.start_with?("y")
    
end

prompt("Goodbye!")