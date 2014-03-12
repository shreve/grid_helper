require 'spec_helper'

include Grid::DSL

describe Grid::DSL do
  it "builds a column properly" do
    column = three_columns do
      "<p></p>"
    end
    column.must_equal "<div class=\"small-3 medium-3 large-3 columns\"><p></p></div>"
  end

  it "builds a row properly" do
    row = row(class: 'nav') do
      "<h1>Hello</h1>"
    end
    row.must_equal "<div class=\"row nav\"><h1>Hello</h1></div>"
  end
end
