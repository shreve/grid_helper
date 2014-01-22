require_relative 'grid/builder'
require_relative 'grid/config'
require_relative 'grid/dsl'

module Grid
  def self.config
    @@config ||= Grid::Config.new
  end

  def self.configure(&block)
    config
    block.call(@@config)
  end

  def self.build_class(options)
    klass = ""
    [:large, :medium, :small, :xsmall].each do |size|
      klass << " #{config.class_names[config.grid_system][size]}#{options[size]}" if config.class_names[config.grid_system][size]
    end
    klass << options[:class] if options[:class]
    klass.strip
  end
end
