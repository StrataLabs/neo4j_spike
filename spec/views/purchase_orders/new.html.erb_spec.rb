require 'spec_helper'

describe "purchase_orders/new.html.erb" do
  before(:each) do
    assign(:purchase_order, stub_model(PurchaseOrder,
      :amount => "9.99"
    ).as_new_record)
  end

  it "renders new purchase_order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => purchase_orders_path, :method => "post" do
      assert_select "input#purchase_order_amount", :name => "purchase_order[amount]"
    end
  end
end
