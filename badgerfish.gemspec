# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'badgerfish/version'

Gem::Specification.new do |spec|
  spec.name          = 'badgerfish'
  spec.version       = Badgerfish::VERSION
  spec.authors       = ['Michael Sievers']
  spec.email         = ['michael_sievers@web.de']
  spec.description   = %q{Badgerfish xml to json convention for ruby}
  spec.summary       = %q{Badgerfish xml to json convention for ruby}
  spec.homepage      = "https://github.com/msievers/badgerfish"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'ox',         '>= 2.1.1'

  spec.add_development_dependency 'activesupport', '>= 3.2.0', '< 5.0.0'
  spec.add_development_dependency 'bundler',       '~> 1.3'
  spec.add_development_dependency 'minitest',      '~> 5.0.6'
  spec.add_development_dependency 'multi_json',    '~> 1.7.9'
  spec.add_development_dependency 'oj',            '~> 2.1.4'
  spec.add_development_dependency 'pry',           '~> 0.9.12.2'
  spec.add_development_dependency 'pry-nav',       '~> 0.2.3'
  spec.add_development_dependency 'rake'
end
