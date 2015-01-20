# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'capistrano-public-cache'
  spec.version       = '0.0.2'
  spec.authors       = ['PJ Kelly']
  spec.email         = ['pj@crushlovely.com']
  spec.description   = %q{Cache dynamic pages into your public folder on deploy.}
  spec.summary       = %q{Cache dynamic pages into your public folder on deploy.}
  spec.homepage      = 'https://github.com/crushlovely/capistrano-public-cache'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'capistrano', '>= 3.0.0.pre'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
