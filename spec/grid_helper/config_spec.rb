require 'spec_helper'

describe GridHelper::Config do
  before do
    @config = GridHelper::Config.new
  end

  it "can be passed initialization options" do
    config = GridHelper::Config.new({ option: :value })
    config.option.must_equal :value
  end

  it "allows method access to data" do
    @config.option = :value
    @config.option.must_equal @config.data[:option]
  end
end
