class Parent < Neo4j::Rails::Model
  property :name
  property :search_text, :type => String
  index :search_text, :type => :fulltext
  before_save :build_search_text
  
  def build_search_text
    self.search_text = props.reject{|key, value| key.to_sym == :search_text}.values.join " "
  end
  
  def message
    "Message from parent"
  end
end

class Child < Parent
  property :child_field, :type => String
  def message
    "Message from child"
  end
end

class SecondChild < Parent
  property :child_field, :type => String
  def message
    "Message from second child"
  end
end