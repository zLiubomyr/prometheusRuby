arr=Array.new
9.times {arr.push(gets.strip.to_i)}
puts arr.select{|number| number <0}.count