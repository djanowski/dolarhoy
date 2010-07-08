Gem::Specification.new do |s|
  s.name = 'dolarhoy'
  s.version = '0.2.0'
  s.summary = %{A command-line tool for DolarHoy.com.}
  s.date = %q{2009-01-09}
  s.author = "Damian Janowski"
  s.email = "damian.janowski@gmail.com"

  s.specification_version = 2 if s.respond_to? :specification_version=

  s.files = ["lib/dolarhoy/currency.rb", "lib/aliases.yml", "bin/dolarhoy", "README", "LICENSE", "Rakefile"]

  s.require_paths = ['lib']

  s.bindir = "bin"
  s.executables = "dolarhoy"

  s.add_dependency("nokogiri", ">= 1.4.2")
end
