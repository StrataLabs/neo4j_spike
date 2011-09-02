require 'spec_helper'

describe Account do
  it "benchmark" do
    account = Account.create!(:name => "test")
    Account.transaction do
      (1..1000).each  do |i|
        puts "Creating transaction number #{i}"
        account.incurs.create(:amount => i, :date => (Date.today + i.days))
      end
    end

    # puts Account.incurs.count
    puts Account.incurs.find(:date => (Date.today..Date.today + 500.days))
  end
end
