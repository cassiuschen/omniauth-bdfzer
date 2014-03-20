# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'omniauth/bdfzer_id/version'

Gem::Specification.new do |s|
  s.name     = 'omniauth-bdfzer'
  s.version  = OmniAuth::Bdfzer::VERSION
  s.authors  = ['Cassius Chen']
  s.email    = ['chzsh1995@gmail.com']
  s.summary  = 'BDFZer OAuth2 Strategy for OmniAuth'
  s.homepage = 'https://github.com/cassiuschen/omniauth-bdfzer'
  s.license  = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.1'

  s.add_development_dependency 'minitest'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'rake'
end
