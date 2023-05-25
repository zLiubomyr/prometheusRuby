def matrix_params(arr)
  m=0
  u=0
  o=0
  e=0
  arr.each do |row|
    r=0
    row.each do |el|
      if e == r
        m+=el
      elsif r>e
        u+=el
      else
        o+=el
      end
      r+=1
    end
    e+=1
  end
  return {"m"=>m, "u"=>u, "o"=>o}
end

puts(matrix_params([[1,2,3],[4,5,6],[7,8,9]])) # {"m"=>15, "u"=>11, "o"=>19}
puts(matrix_params([[1,2,2],[3,1,2],[3,3,1]])) # {"m"=>3, "u"=>6, "o"=>9}

