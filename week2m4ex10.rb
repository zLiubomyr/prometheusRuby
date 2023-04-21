print 'Enter a: '
a=gets.strip.to_i
print 'Enter b: '
b=gets.strip.to_i
print 'Enter c: '
c=gets.strip.to_i

# count=0
# if a==b
#   count+=1
#   count+=1 if a==c
# else
#   if a==c
#     count+=1
#   elsif b==c
#     count+=1
#   end
# end
count = ((a == b) ? 1 : 0) + ((a == c) ? 1 : 0) + ((b == c && a != b) ? 1 : 0)
print count