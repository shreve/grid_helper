$:.unshift(File.dirname(File.expand_path(__FILE__)))

begin
  require 'rails'
  require 'grid/railtie'
ensure
  require 'string'
  require 'grid/config'
  require 'grid/builder'
  require 'grid/dsl'
end

module Grid
  def self.version
    "0.0.1"
  end
end
