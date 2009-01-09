class Currency
  include Comparable

  attr_accessor :name, :buy, :sell

  def initialize(name, buy, sell)
    @name = sanitize_name(name)
    @buy = parse(buy)
    @sell = parse(sell)
  end

  def <=>(other)
    name <=> other.name
  end

  def parse(text)
    text[/([\d\.,]+)/, 1].to_f
  end

  def format(number)
    "%.3f" % number
  end

  def sanitize_name(name)
    name = name.dup
    name.gsub!('Á', 'A')
    name.gsub!('É', 'E')
    name.gsub!('Í', 'I')
    name.gsub!('Ó', 'O')
    name.gsub!('Ú', 'U')
    name.gsub!("\r", " ")
    name.gsub!("\n", " ")
    name[/^([\w\s\.\$]+)/, 1].strip.capitalize.squeeze(' ')
  end

  def to_s
    "#{name.ljust(28)} #{format buy} #{format sell}"
  end
end
