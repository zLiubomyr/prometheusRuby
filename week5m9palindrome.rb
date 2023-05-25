def palindrome?(str)
  for i in 0..((str.length/2)-1)
    if str[i] != str[str.length-1-i]
      return false
    else
      return true
    end
  end
end

p palindrome?("козак з казок")