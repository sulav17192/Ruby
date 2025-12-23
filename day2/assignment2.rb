def add_item(cart, name, price, qty)
    item= {
        "name"=>name,
        "price"=>price,
        "qty"=>qty
    }
    cart<<item
end

def remove_item(cart, name)
    i=0
    while i<cart.length
        if cart[i]["name"]==name
            cart.delete_at(i)
        end
        i=i+1
    end
end


def total_price(cart)
  total = 0
  i = 0
  while i < cart.length
    total = total + (cart[i]["price"] * cart[i]["qty"])
    i = i + 1
  end
  return total
end

def show_cart(cart)
    i=0
    while i<cart.length
        puts "Name: #{cart[i]["name"]}, Price: #{cart[i]["price"]}, Quantity: #{cart[i]["qty"]}"
        i=i+1
    end
end

cart=[]
loop do
  puts "Enter command (add, remove, show, total, exit):"
  command = gets.chomp

   if command == "add"
    puts "Enter item name:"
    name = gets.chomp
    puts "Enter price:"
    price = gets.chomp.to_i
    puts "Enter quantity:"
    qty = gets.chomp.to_i
    add_item(cart, name, price, qty)

  elsif command == "remove"
    puts "Enter item name to remove:"
    name = gets.chomp
    remove_item(cart, name)

  elsif command == "show"
    show_cart(cart)

  elsif command == "total"
    puts "Total price: #{total_price(cart)}"

  elsif command == "exit"
    puts "Thank you!"
    break

  else
    puts "Invalid command"
  end
end
