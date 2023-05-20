def sqrt(a)
  begin
  if a > 0
  Math.sqrt(a).round(4)
  else
    raise StandardError
  end
  rescue StandardError
    puts "The root of a negative number does not exist in rational numbers"
  end
end

#
# def sqrt(a)
#   catch :err do
#     puts Math.sqrt(a).round(4)
#     throw :err
#     puts "The root of a negative number does not exist in rational numbers" if a < 0
#   end
# end
# puts sqrt(-4)