balance = 1056.254

loop do
  puts "---ATM Menu---"
  puts "1. Check balance"
  puts "2. Deposit Money"
  puts "3. Withdraw Money"
  puts "4. Exit"

  print "Choose an Option: "
  choice = gets.chomp

  case choice
  when "1"
    puts "Your current balance is #{balance}"

  when "2"
    print "Enter the amount to deposit: "
    amount = gets.to_f
    balance += amount
    puts "Your new balance is #{balance}"

  when "3"
    print "Enter the amount to withdraw: "
    amount = gets.to_f
    if amount > balance
      puts "Insufficient Funds in your account"
    else
      balance -= amount
      puts "Withdraw Successful. New balance is #{balance}"
    end

  when "4"
    puts "Thank you for using ATM. Goodbye!"
    break

  else
    puts "Invalid Option"
  end
end
