# print 'Введіть ціну цукерок для 1 кг '
# price = gets.strip.to_i
#
# 5.times do
#   print 'Введіть в кг вагу цукерок, ціну яких Ви хочете дізнатися '
#   weight = gets.strip.to_i
#   puts price * weight
# end

divider = 21

for i in 1..5
  print "Введіть число, яке буде ділитися на #{divider} : "
  n = gets.strip.to_i
  if n == divider
    puts "Число не повинно дорівнювати #{divider}"
    next
  elsif n % divider == 0
    puts 'Чудово'
    break
  elsif n % divider != 0
    puts 'Невірно. Спробуйте ще раз'
  end
  if i == 5
    puts 'Кількість спроб завершилася :('
    break
  end
end
