require_relative './spec_helper'

describe Grid do
  describe "configuration" do
    it "allows method access to it's configuration" do
      Grid.config.must_be_instance_of Grid::Config
    end

    it "keeps configuration set in a block" do
      Grid.configure do |config|
        config.custom_option = :a_value
      end
      Grid.config.custom_option.must_equal :a_value
    end
  end

  describe "class builder" do
    it "properly responds to size" do
      options = {
        small: 12,
        medium: 8,
        large: 2
      }
      Grid.config.grid_system = :foundation
      Grid::Builder.klass(options).must_match "small-12 medium-8 large-2 columns"
    end
  end
end
