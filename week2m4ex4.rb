print "your expirience: "
expirience=gets.strip.to_i
print "your age: "
age=gets.strip.to_i
  if expirience>=5 and age<=40
   res="Candidate is suitable"
  else
   res="Candidate is not suitable"
  end
  puts res