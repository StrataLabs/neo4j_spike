require 'spec_helper'

describe "bills/edit.html.erb" do
  before(:each) do
    @bill = assign(:bill, stub_model(Bill,
      :amount => "9.99"
    ))
  end

  it "renders the edit bill form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bills_path(@bill), :method => "post" do
      assert_select "input#bill_amount", :name => "bill[amount]"
    end
  end
end
