require 'spec_helper'

describe Bill do  
  it "should allow search for bills based on any field" do
    b = Bill.create(:amount => 10, :date => Date.new, :name => "Computer", :description => "Long Computer Description")
    p = PurchaseOrder.create(:amount => 10, :date => Date.new, :name => "Computer", :description => "Long Computer Description")
    b.search.should == "10 Long Computer Description Computer"
    p.search.should == "10 Long Computer Description Computer"
    retrieved = Bill.find('search: Computer', :type => :fulltext)
    b.should == retrieved
  end
  
  it "should allow creating with purchase orders" do
    p = PurchaseOrder.create(:amount => 10, :date => Date.new, :name => "Computer", :description => "Long Computer Description")
    b = Bill.create(:amount => 10, :date => Date.new, :name => "Computer", :description => "Long Computer Description", 
                    :purchase_order => p)
    b.save
    b = Bill.first
    Bill.first.purchase_order.should == p
  end

  it "should allow creating nil purchase orders" do
    p = PurchaseOrder.create(:amount => 10, :date => Date.new, :name => "Computer", :description => "Long Computer Description")
    b = Bill.create(:amount => 10, :date => Date.new, :name => "Computer", :description => "Long Computer Description", 
                    :purchase_order => nil)
    b = Bill.first
    Bill.first.purchase_order.should == nil
  end


  it "should allow updating purchase orders" do
    p = PurchaseOrder.create(:amount => 10, :date => Date.new, :name => "Computer", :description => "Long Computer Description")
    b = Bill.create(:amount => 10, :date => Date.new, :name => "Computer", :description => "Long Computer Description", 
                    :purchase_order => p)                    
    b = Bill.first
    b.purchase_order=nil
    b.save
    Bill.first.purchase_order.should == nil
    PurchaseOrder.first.should_not == nil
  end
end
