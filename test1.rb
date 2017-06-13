class Main
  def run
    loop do
      iteracii = feedback
      str = "1"
      s = 0
      while s < iteracii do
        result = ""
        while str.length > 0 do
          symbol, len, str = search_substring(str)
          result += "#{len}#{symbol}"
        end
        puts result
        str = result
        s += 1
      end
      anykey
    end
  end
  private
  def anykey
    print "Нажмите Enter для продолжения.."
    gets.chomp
  end
  def feedback
    loop do 
      system 'clear'
      print "Введите количество шагов итерации: "
      valin = gets.chomp.to_s.strip.downcase
      valout = /(^[0-9]*$)/.match(valin)
      next if valout.nil?
      valout = valout[1]
      return valout.to_i if valin == valout
    end
  end
  def search_substring(str)
    s = /(^#{str[0]}*)(.*)/.match(str)
    return str[0], s[1].length, s[2]
  end
end

main = Main.new
main.run