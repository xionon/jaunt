# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jaunt/version'

Gem::Specification.new do |spec|
  spec.name          = 'jaunt'
  spec.version       = Jaunt::VERSION
  spec.authors       = ['Alec Hipshear']
  spec.email         = ['alechipshear@gmail.com']

  spec.summary       = 'Jaunt is a tool for exploring codebases'
  spec.description   = <<-JAUNT
    Jaunt provides simple command line tool for exploring and getting an understanding of a new
    codebase. Jaunt provides two modes: guided (driven by special comments) and automatic (driven
    by git repo analysis)'
  JAUNT
  spec.homepage      = 'https://www.github.com/xionon/jaunt'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |file|
    file.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'thor', '0.19.1'
  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
