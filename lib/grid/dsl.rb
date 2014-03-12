module Grid
  module DSL
    def column(options = {}, content = nil, &block)
      Grid::Builder::column(options, content, &block)
    end

    def row(options = {}, &block)
      Grid::Builder.row(options, &block)
    end


    # klass = Grid::Builder.build_class(options)
    # klass << "columns"
    # content_tag(
    #   (options[:tag] || :div),
    #   (content || options[:content] || capture("".html_safe, &block)),
    #   class: klass)
    # end


    # def row(options={}, &block)
    #   klass = "row"
    #   klass << Grid.build_class(options)
    #   content_tag(:div, capture("".html_safe, &block), class: klass)
    # end

    {
      one: 1,
      two: 2,
      three: 3,
      four: 4,
      five: 5,
      six: 6,
      seven: 7,
      eight: 8,
      nine: 9,
      ten: 10,
      eleven: 11,
      twelve: 12
    }.each do |w,n|
      method_name = "#{w}_columns"
      method_name.sub('s','') if n == 1
      define_method(method_name) do |options = {}, content = nil, &block|
        options = Grid::Builder.default_sizes(n).merge(options)
        column(options, content, &block)
      end
      alias_method "#{w}_block".to_sym, method_name
    end
  end
end
