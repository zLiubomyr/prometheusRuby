print'кількість предметів '
n = gets.strip.to_i
avg=0.0
for i in 1..n
  print "оцінка #{i} предмету "
  avg+=gets.strip.to_i
end
puts avg/n
