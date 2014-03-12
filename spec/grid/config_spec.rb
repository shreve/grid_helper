require 'spec_helper'

describe Grid::Config do
  before do
    @config = Grid::Config.new
  end

  it "can be passed initialization options" do
    config = Grid::Config.new({ option: :value })
    config.option.must_equal :value
  end

  it "allows method access to data" do
    @config.option = :value
    @config.option.must_equal @config.data[:option]
  end
end
