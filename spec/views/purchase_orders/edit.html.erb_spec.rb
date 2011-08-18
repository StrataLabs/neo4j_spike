require 'spec_helper'

describe "purchase_orders/edit.html.erb" do
  before(:each) do
    @purchase_order = assign(:purchase_order, stub_model(PurchaseOrder,
      :amount => "9.99"
    ))
  end

  it "renders the edit purchase_order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => purchase_orders_path(@purchase_order), :method => "post" do
      assert_select "input#purchase_order_amount", :name => "purchase_order[amount]"
    end
  end
end
