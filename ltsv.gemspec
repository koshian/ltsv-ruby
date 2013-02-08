# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ltsv/version'

Gem::Specification.new do |gem|
  gem.name          = "ltsv"
  gem.version       = LTSV::VERSION
  gem.authors       = ["Sugano `Koshian' Yoshihisa(E)"]
  gem.email         = ["koshian@foxking.org"]
  gem.description   = %q{Ruby LTSV package}
  gem.summary       = %q{LTSV package for ruby}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
