# -*- encoding: utf-8 -*-

require File.expand_path('../lib/grid/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'grid_helper'
  s.version = Grid::Version::STRING
  s.platform = Gem::Platform::RUBY
  s.authors = "Jacob Evan Shreve"
  s.email = %w(jacob@shreve.ly)
  s.summary = 'A dsl for grid-system-based markup'
  s.description = 'Grid helper creates helper methods to generate nice erb markup with nice html output.'
  s.homepage = 'https://github.com/shreve/grid_helper'
  s.license = 'MIT'

  s.files = `git ls-files`.split("\n")
  s.require_path = 'lib'
end
