KAN = { 0=>"零", 1=>"一", 2=>"二", 3=>"三", 4=>"四", 5=>"五",6=>"六", 7=>"七",
      8=>"八",9=>"九", 10=>"十", (10**2)=>"百", (10 **3)=>"千", (10**4)=>"万",
      (10**8)=>"億", (10**12)=>"兆", (10**16)=>"京", (10**20)=>"垓",(10**24)=>"𥝱",
      (10**28)=>"穣", (10**32)=>"溝", (10**36)=>"澗", (10**40)=>"正",
      (10**44)=>"載",(10**48)=>"極", (10**52)=>"恒河沙",(10**56)=>"阿僧祇",
      (10**60)=>"那由他", (10**64)=>"不可思議", (10**68)=>"無量大数" }
class String
  def to_number(res = 0, curr = 0, leng = KAN.length)
    return number(self) if KAN.to_a[13..leng].empty?{ |a| self.include?(a[1]) }
    KAN.to_a[13..leng].reverse_each do |a|
      next if self.index(a[1]).blank?
      res += number(self[curr..self.index(a[1])-1]) * KAN.key(a[1])
      curr = self.index(a[1]) + a[1].length
    end
    return res + number(self[curr..self.length]).to_i
  end
  def number(str, res = 0, curr = KAN.key(str.slice!(0)).to_i)
    return curr if str.length == 0 || str.blank?
    return (curr % 10 != 0 && KAN.key(str[0]).to_i % 10 == 0) ? \
    (curr * KAN.key(str.slice!(0))+ number(str)) : (curr + number(str))
  end
end
class Numeric
  def to_kansuji(res = '')
    return KAN[self] if self == 0
    self.to_s.reverse.split('').each_slice(4).with_index().each do |a, i|
      key = i > 0 ? KAN.to_a[i+12][1] : '' if a.reverse.join('').to_i > 0
      res = kanji(a.reverse.join('')) + key.to_s + res
    end
    return res
  end
  def kanji(str, length = str.length - 1)
    return str[0] == '0' ? '' : KAN[str[0].to_i] if str.length == 1
    return kanji(str[1..(str.length)]) if str[0]=='0'
    return KAN[str.slice!(0).to_i * 10**length] + kanji(str) if str[0] == '1'
    return KAN[str.slice!(0).to_i] + KAN[10**length] + kanji(str)
  end
end
