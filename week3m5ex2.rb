# frozen_string_literal: true

a = gets.strip.to_i
b = gets.strip.to_i
c = gets.strip.to_i

while (a % c) != 0
  a += 1
end
while a <= b
  puts a
  a += c
end


# while a <= b
#   if a % c == 0
#     puts a
#   end
#   a=a+1
# end