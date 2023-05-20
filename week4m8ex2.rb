arr=Array.new
7.times {arr.push(gets.strip.to_f)}
puts arr.select{|number| number >=0}.inject(:*)