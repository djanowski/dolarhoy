# encoding: UTF-8

require "yaml"

class DolarHoy::Currency
  include Comparable

  attr_accessor :name, :buy, :sell

  def initialize(name, buy, sell)
    @name = sanitize_name(name)
    @buy = parse(buy)
    @sell = parse(sell)
  end

  def <=>(other)
    self.alias <=> other.alias
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
    "#{self.alias} #{format buy} #{format sell} #{format average}"
  end

  def aliases
    @@aliases ||= YAML.load_file(File.expand_path(File.join(File.dirname(__FILE__), '..', 'aliases.yml')))
  end

  def reverse_aliases
    @@reverse_aliases ||= aliases.inject({}) do |reverse, (code, names)|
      [*names].each { |name| reverse[name] = code }
      reverse
    end
  end

  def aliased?
    !! self.alias
  end

  def alias
    reverse_aliases[name]
  end

  def average
    (buy + sell) / 2.0
  end
end
