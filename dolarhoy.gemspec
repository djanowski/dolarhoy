Gem::Specification.new do |s|
  s.name = 'dolarhoy'
  s.version = '0.1.1'
  s.summary = %{A command-line tool for DolarHoy.com.}
  s.date = %q{2009-01-09}
  s.author = "Damian Janowski"
  s.email = "damian.janowski@gmail.com"

  s.specification_version = 2 if s.respond_to? :specification_version=

  s.files = ["lib/dolarhoy/currency.rb", "bin/dolarhoy", "README", "LICENSE", "Rakefile"]

  s.require_paths = ['lib']

  s.bindir = "bin"
  s.executables = "dolarhoy"

  s.add_dependency("hpricot", ">= 0.6")
end
