# -*- encoding: utf-8 -*-
require File.expand_path('../lib/tellstick/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Joakim Eriksson']
  gem.email         = ['joakim.eriksson@aliencolony.net']
  gem.description   = %q{Controll a TellStick USB home automation system.}
  gem.summary       = %q{Controll a TellStick USB Dongle.}
  gem.homepage      = 'https://github.com/xertres/tellstick'

  gem.files         = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md)
  gem.name          = 'tellstick'
  gem.require_paths = ['lib']
  gem.version       = TellStick::VERSION

  gem.add_dependency 'ffi'
end
