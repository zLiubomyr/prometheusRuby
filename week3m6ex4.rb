def max_two (a, b)
  return a > b ? a : b
end
puts "Enter 4 numbers"
a=gets.strip
b=gets.strip
c=gets.strip
d=gets.strip

print "Max is "
puts max_two(max_two(a, b), max_two(c, d))

