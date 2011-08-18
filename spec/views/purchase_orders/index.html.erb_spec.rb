require 'spec_helper'

describe "purchase_orders/index.html.erb" do
  before(:each) do
    assign(:purchase_orders, [
      stub_model(PurchaseOrder,
        :amount => "9.99"
      ),
      stub_model(PurchaseOrder,
        :amount => "9.99"
      )
    ])
  end

  it "renders a list of purchase_orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
