print "Enter a: "
a=gets.strip.to_i
print "Enter b: "
b=gets.strip.to_i
print "Enter c: "
c=gets.strip.to_i
count=0
if a==b
  count+=1
  if a==c
    count+=1
  end
else
if a==c
    count+=1
  else
    if b==c
      count+=1
    end
  end
end
print count