print "Enter mark: "
mark=gets.strip.to_i
case
when mark>=90
  res="A"
when mark>=80
  res="B"
when mark>=70
  res="C"
when mark>=60
  res="D"
else res="F"
end
print res