# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'grid'

Gem::Specification.new do |s|
  s.name = 'grid-helper'
  s.version = Grid.version
  s.platform = Gem::Platform::RUBY
  s.authors = "Jacob Evan Shreve"
  s.email = %w(jacob@shreve.ly)
  s.summary = 'A dsl for grid-system-based markup'
  s.description = 'A dsl for grid-system-based markup'
  s.homepage = 'https://github.com/shreve/grid_helper'
  s.license = 'MIT'

  s.files = Dir['lib/**/*']
end
