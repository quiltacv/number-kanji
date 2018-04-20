KAN = { 0=>"零", 1=>"一", 2=>"二", 3=>"三", 4=>"四", 5=>"五", 6=>"六", 7=>"七",
      8=>"八", 9=>"九", 10=>"十", 100=>"百", 1000=>"千", 10000=>"万", (10**8)=>"億",
      (10**12)=>"兆", (10**16)=>"京", (10**20)=>"垓", (10**24)=>"𥝱",
      (10**28)=>"穣", (10**32)=>"溝", (10**36)=>"澗", (10**40)=>"正",
      (10**44)=>"載", (10**48)=>"極", (10**52)=>"恒河沙", (10**56)=>"阿僧祇",
      (10**60)=>"那由他", (10**64)=>"不可思議", (10**68)=>"無量大数" }
ROM = KAN.to_a[13..30]
class String
  def to_number()
    current = 0
    ROM.empty?{ |a| self.include?(a[1]) } ? (return number(self)) : result = 0
    ROM.reverse_each do |array|
      next if self.index(array[1]).nil?
      result += number(self[current..self.index(array[1])-1]) * KAN.key(array[1])
      current = self.index(array[1]) + array[1].length
    end
    return result + number(self[current..self.length]).to_i
  end
  def number(str)
    current = KAN.key(str.slice!(0)).to_i
    return current if str.length == 0
    return ((current / 10 == 0 && KAN.key(str[0]).to_i % 10 == 0) ? \
                        current * KAN.key(str.slice!(0)) : current) + number(str) #1-9 -- 10-1000
  end
end #112345 ->5,4,3,2,1,1 -> [5,4,3,2][1,1] -> 2345
class Numeric
  def to_kansuji
    self == 0 ? (return KAN[self]) : result = ''
    self.to_s.reverse.split('').each_slice(4).with_index().each do |array, index|
      key = index > 0 ? ROM[index-1][1] : '' if array.reverse.join('').to_i > 0 # 4 so 0
      result = kanji(array.reverse.join('')) + key.to_s + result.to_s
      return result if index == self.to_s.reverse.split('').each_slice(4).size - 1
    end
  end
  def kanji(str)
    return str[0] == '0' ? '' : KAN[str[0].to_i] if str.length == 1
    return kanji(str[1..str.length]) if str[0] == '0'
    return (str[0] == '1' ? KAN[str.slice!(0).to_i * 10**str.length] : \
            KAN[str.slice!(0).to_i] + KAN[10**str.length]) +  kanji(str) #slice!
  end
end
