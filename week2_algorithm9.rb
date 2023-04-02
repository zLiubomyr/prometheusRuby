lifetime_parent1=gets.strip.to_i
lifetime_parent2=gets.strip.to_i
lifetime_grandfather1=gets.strip.to_i
lifetime_grandfather2=gets.strip.to_i
lifetime_grandmother1=gets.strip.to_i
lifetime_grandmother2=gets.strip.to_i

lifetime = (lifetime_parent1 + lifetime_parent2 + lifetime_grandfather1 + lifetime_grandfather2 + lifetime_grandmother1 + lifetime_grandmother2)/6.0

p lifetime