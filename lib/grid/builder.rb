module Grid
  module Builder
    def self.column(options = {}, content = nil, &block)
      options[:class] = "#{klass(options)} #{options[:class]}"
      content_tag(options, content, &block)
    end

    def self.row(options = {}, &block)
      options[:class] = "row #{options[:class]}"
      content_tag(options, &block)
    end

    def self.klass(options = {})
      singular = true
      [:small, :medium, :large, :xlarge, :xxlarge].map do |size|
        if options and options[size]
          singular = false if options[size] > 1
          prefix = Grid.config.class_names[size]
          if prefix
            "#{prefix}#{options[size]}"
          end
        end
      end.join(' ').strip << " column#{'s' unless singular}"
    end

    def self.default_sizes(number)
      default = {}
      [:small, :medium, :large, :xlarge, :xxlarge].each do |size|
        default[size] = number
      end
      default
    end

    private
    # Todo: Make content_tag and capture fall back on
    # ActionView::Helpers::TagHelper
    # ActionView::Helpers::CaptureHelper
    def self.content_tag(options = {}, content = nil, &block)
      tag = options[:tag] || :div
      # return super(tag, content, options, true, block) if defined?(super)
      "<#{tag} #{attributes_from(options)}>#{content || capture("".html_safe, &block)}</#{tag}>".html_safe
    end

    def self.capture(*args)
      # return super(args) if defined?(super)
      if block_given?
        text = yield(args)
      end
    end

    def self.attributes_from(options = {})
      attributes = []
      options.reject do |attribute, value|
        Grid.config.hidden_attributes.include? attribute
      end.each_pair do |attribute, value|
        attributes.push "#{attribute}=\"#{value.strip}\""
      end
      attributes.join(' ')
    end
  end
end
