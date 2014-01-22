module Grid
  module DSL
    def column(content=nil, options={}, &block)
      klass = GridHelper.build_class(options)
      klass << "columns"
      content_tag(
        (options[:tag] || :div),
        (content || options[:content] || capture("".html_safe, &block)),
        class: klass)
    end

    def row(options={}, &block)
      klass = "row"
      klass << GridHelper.build_class(options)
      content_tag(:div, capture("".html_safe, &block), class: klass)
    end

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
      method_name = "#{n}_columns"
      method_name.sub('s','') if n == 1
      define_method(method_name) do |content=nil, options={}, &block|
        options = Hash.new(n).merge(options)
        column(content, options, &block)
      end
      alias_method "#{w}_block".to_sym, method_name
    end

  end
end
