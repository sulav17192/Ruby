number=rand(1..20)
guess= nil

while guess!= number
    guess= gets.to_i

    if guess>number
        puts "Number is lower"
    elsif guess<number
        puts "Number is higher"
    else
        puts "You guessed it correctly"
    end
end