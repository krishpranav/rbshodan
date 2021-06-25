lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rbshodan/version'


Gem::Specification.new do |spec|
    spec.name          = 'rbshodan'
    spec.version       = Rbshodan::VERSION
    spec.authors       = ["krishpranav"]
    spec.email         = ['']
  
    spec.summary       = "A shodan library written in ruby"
    spec.description   = 'Featuring full support for the REST, Streaming and Exploits API'
    spec.homepage      = 'https://github.com/krishpranav/rbshodan'
    spec.license       = 'MIT'
  
    spec.files         = `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
    spec.require_paths = ['lib']
  
    spec.add_dependency 'async-http', '>= 0.38.1', '< 0.55.0'
    spec.add_dependency 'async', '>= 1.17.1', '< 1.30.0'
  
    spec.add_development_dependency 'async-rspec', '~> 1.15.0'
    spec.add_development_dependency 'bundler', '~> 2.2.0'
    spec.add_development_dependency 'pry', '~> 0.13.0'
    spec.add_development_dependency 'rake', '~> 13.0.0'
    spec.add_development_dependency 'rb-readline', '~> 0.5.5'
    spec.add_development_dependency 'rspec', '~> 3.10.0'
  end
