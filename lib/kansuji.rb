KAN = {0=>"零", 1=>"一", 2=>"二", 3=>"三", 4=>"四", 5=>"五",6=>"六", 7=>"七", 8=>"八",
      9=>"九", 10=>"十", (10**2)=>"百", (10 **3)=>"千", (10**4)=>"万", (10**8)=>"億",
      (10**12)=>"兆", (10**16)=>"京", (10**20)=>"垓", (10**24)=>"𥝱", (10**28)=>"穣",
      (10**32)=>"溝", (10**36)=>"澗", (10**40)=>"正", (10**44)=>"載", (10**48)=>"極",
      (10**52)=>"恒河沙", (10**56)=>"阿僧祇", (10**60)=>"那由他",  (10**64)=>"不可思議",
      (10**68)=>"無量大数" }
KEY = ['万','億','兆','京','垓','𥝱','穣','溝','澗','正','載','極','恒河沙','阿僧祇','那由他','不可思議','無量大数']
class String
  def to_number(res = 0, curr = 0)
    return get_number(self) if !KEY.any?{ |key| self.include?(key) }
    KEY.reverse.each do |item|
      next if self.index(item).blank?
      res += get_number(self[curr..self.index(item)-1]) * KAN.key(item)
      curr = self.index(item) + item.length
    end
    return res + get_number(self[curr..self.length]).to_i
  end
  def get_number(str, res = 0, curr = '')
    begin
       curr = KAN.key(str[0]).to_i
       curr *= KAN.key(str.slice!(1..1)).to_i if (curr % 10 != 0 &&
               KAN.key(str[1]).to_i % 10 == 0 && str[1].present?)
       (str.length == 1) ? (return res + curr) : res += curr
     end while str.slice!(0).present?
  end
end
class Numeric
  def to_kansuji(res = '', count = 0)
    return KAN[self] if self == 0
    self.to_s.reverse.split('').each_slice(4).with_index().each do |fa, index|
      key = (index > 0) ? KEY[index-1] : '' if fa.reverse.join('').to_i > 0
      res = (kanji_to_demo(fa.reverse.join('')) + key.to_s + res)
    end
    return res
  end
  def kanji_to_demo(str, kan = '')
    begin
      return str[0]=='0' ? kan : kan + KAN[str[0].to_i] if str.length==1
      next if str[0]=='0'
      next kan += KAN[str[0].to_i] + KAN[(10**(str.length-1))] if str[0] != '1'
      kan = '一' + kan if (str.length >= 5)
      kan += (KAN[(str[0].to_i * 10**(str.length-1))])
    end while str.slice!(0).present?
  end
end
