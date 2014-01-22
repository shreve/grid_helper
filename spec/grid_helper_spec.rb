require 'spec_helper'

describe GridHelper do

  describe "configuration" do
    it "allows method access to it's configuration" do
      GridHelper.config.must_be_instance_of GridHelper::Config
    end

    it "keeps configuration set in a block" do
      GridHelper.configure do |config|
        config.custom_option = :a_value
      end
      GridHelper.config.custom_option.must_equal :a_value
    end
  end

  describe "class builder" do
    it "properly responds to size" do
      options = {
        small: 12,
        medium: 8,
        large: 2
      }
      GridHelper.config.grid_system = :foundation
      GridHelper.build_class(options).must_equal "large-2 medium-8 small-12"
    end
  end
end
