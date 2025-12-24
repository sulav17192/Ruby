# arr = [1,2,5,6,8,5,2,2]

# # new_arr = arr.select {|x| x==5}
# rejected_arr = arr.reject {|val|val == 6 }
# puts rejected_arr



arr = [1, 2, 5, 6, 8, 5, 2, 2]



new_arr=arr.select { |x| x > 3 }.sum
puts new_arr
