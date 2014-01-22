module Grid
  class Config
    attr_accessor :data

    def initialize(options = {})
      self.data = {
        grid_system: :foundation,
        class_names: {
          foundation: {
            large: 'large-',
            medium: 'medium-',
            small: 'small-'
          },

          bootstrap: {
            large: 'col-lg-',
            medium: 'col-md-',
            small: 'col-sm-',
            xsmall: 'col-xs-'
          }
        }
      }
      merge(options)
    end

    def method_missing(method, *args, &block)
      if method.to_s.include?('=')
        self.data[method.to_s.sub('=','').to_sym] = args.first
      elsif data.has_key?(method)
        data[method]
      end
    end

    private
    def merge(options = {})
      if data.respond_to? :deep_merge!
        self.data.deep_merge! options
      else
        self.data.merge! options
      end
    end

  end
end
