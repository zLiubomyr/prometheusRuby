print "enter two numbers: "
number1=gets.strip.to_i
print "and second number: "
number2=gets.strip.to_i

sum= number2 + number1
sum1= (number2 ** 2) + (number1 ** 2)
sum2= sum**2

puts "Сума = #{sum}
Сума квадратів = #{sum1}
Квадрат суми = #{sum2}"
