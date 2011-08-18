require 'spec_helper'

describe "purchase_orders/show.html.erb" do
  before(:each) do
    @purchase_order = assign(:purchase_order, stub_model(PurchaseOrder,
      :amount => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
  end
end
