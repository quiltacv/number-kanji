print 'Input: '
str = gets.chomp
def check_palindrome(string)
  return true if string.length <= 1
  return check_palindrome(string[1...string.length]) if string[0]==' '
  return check_palindrome(string[0...string.length-1]) if string[string.length-1]==' '
  return check_palindrome(string) if string.slice!(0) == string.slice!(string.length-1)
  return false
end
puts check_palindrome(str)
