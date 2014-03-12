require 'spec_helper'

describe Grid::Builder do
  describe "#column" do
    it "can be built without a block" do
      column = Grid::Builder.column({ small: 1 }, "<p>Hello</p>")
      column.must_equal "<div class=\"small-1 column\"><p>Hello</p></div>"
    end

    it "can be built with a block" do
      column = Grid::Builder.column({ small: 1 }) { "<p>Hello</p>" }
      column.must_equal "<div class=\"small-1 column\"><p>Hello</p></div>"
    end
  end

  describe "#row" do
    it "can be built without a block" do
      row = Grid::Builder.row({ class: "nav" })
      row.must_equal "<div class=\"row nav\"></div>"
    end
  end
end
