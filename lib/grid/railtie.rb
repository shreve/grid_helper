require 'grid/dsl'

module Grid
  class Railtie < Rails::Railtie
    initializer "grid.dsl" do
      ActionView::Base.send :include, Grid::DSL
    end
  end
end
