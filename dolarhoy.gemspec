require "./lib/dolarhoy"

Gem::Specification.new do |s|
  s.name = "dolarhoy"
  s.version = DolarHoy::VERSION
  s.summary = %{A command-line tool for DolarHoy.com.}
  s.author = "Damian Janowski"
  s.email = "damian.janowski@gmail.com"

  s.files = `git ls-files`.split("\n")

  s.bindir = "bin"
  s.executables = "dolarhoy"

  s.add_dependency("nokogiri", ">= 1.4.2")
end
