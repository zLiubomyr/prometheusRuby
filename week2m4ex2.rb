print "Enter number: "
number=gets.strip.to_i
if number<0
  res="number is negative"
elsif number>0
  res="Number is posotive"
else
  res="number is zero"
end
puts res