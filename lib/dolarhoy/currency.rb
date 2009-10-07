# encoding: UTF-8

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
    name = name[/^([\w\s\.\$]+)/, 1].strip.capitalize.squeeze(' ')
    reverse_aliases[name] || name
  end

  def to_s
    "#{name} #{format buy} #{format sell}"
  end

  def aliases
    @aliases ||= YAML.load_file(File.expand_path(File.join(File.dirname(__FILE__), '..', 'aliases.yml')))
  end
  
  def reverse_aliases
    unless @reverse_aliases
      @reverse_aliases = {}
      aliases.each do |code,names|
        [*names].each {|name| @reverse_aliases[name] = code }
      end
    end

    @reverse_aliases
  end
end
