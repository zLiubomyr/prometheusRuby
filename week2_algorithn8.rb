print "cost:"
cost=gets.strip.to_f
print "frequency: "
period=gets.strip.to_i

count=365/period
total_cost=count*cost

puts "total is #{total_cost}"