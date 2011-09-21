class PurchaseOrder < Neo4j::Rails::Model
  property :amount, :type => Fixnum
  property :date, :type => Date
  property :description, :type => String
  property :name, :type => String  
  property :search, :type => String

  index :amount
  index :search, :type => :fulltext
  node_indexer Bill  
  before_validation :index_search
  
  def index_search
    self.search = amount.to_s + " " + description + " " + name
  end
end