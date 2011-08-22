require 'spec_helper'

describe Bill do
  it "should load all" do
    b = Bill.new
    b.amount = 20
    b.save
    puts Bill.first.amount
  end
end
