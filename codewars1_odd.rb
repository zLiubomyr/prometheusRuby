# def odd_count n
#   return n/2
# end
def odd_count n
  i=1
  odd_count=0
  while i < n do
    odd_count += 1 if i.odd?
    # p i
    i+=1
    # p odd_count
  end
  return odd_count
end
print "enter your number: "
n=gets.strip.to_i
puts "I found #{odd_count(n)} odd numbers below #{n}"

