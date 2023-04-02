print"side a: "
a=gets.strip.to_f
print "side b: "
b=gets.strip.to_f
print "angle: "
alfa=gets.strip.to_f

s=a*b*Math.sin(alfa)/2

puts "area = #{s}"