class String
  def html_safe
    super if defined?(super)
  end
end
