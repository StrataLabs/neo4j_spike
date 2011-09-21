require 'spec_helper'

describe Child do
  it "should respect inheritance" do
    c = Child.create(:name => "Child one", :foo => "value")
    c2 = SecondChild.create(:name => "Child one two", :foo => "value 3")
    p = Parent.create(:name => "Parent one", :bar => "value 2", :custom_field => "Custom")
    c.search_text.should == "Child one value "
    p.search_text.should == "Parent one value 2 Custom"
    collection = Parent.all('search_text: one', :type => :fulltext)
    collection.size.should == 3
    Child.all('search_text: one', :type => :fulltext).size.should == 1
    Parent.all('search_text: Custom', :type => :fulltext).size.should == 1
  end
end
