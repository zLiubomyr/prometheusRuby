puts (7==7&&7>7)
puts (false&&true)
puts (22&&13)
puts (7==7 and 7>7)
puts (false and true)
puts (22 and 13)
puts(7==7||7>7)
puts(false || true)
puts(22 || 13)
puts "34dfd  #{ ( 7 > 0 ) and ( 7 == 7 ) }"
a, b = 5, 5
# тернарний оператор
x=a>b ? "ok" : "no"
p x

# пріоритети операторів:
# !, ~, unary +
# **
# unary -
# *, /, %
# +, -
# <<, >>
# &
# |, ^
# >, >=, <, <=
# <=>, ==, ===, !=, =~, !~
# &&
# ||
# .., ...
# ?, :
# modifier-rescue
# =, +=, -=, etc.
# defined?
# not
# or, and
# modifier-if, modifier-unless, modifier-while, modifier-until
# { } blocks