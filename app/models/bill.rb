class Bill < Neo4j::Rails::Model
  property :amount, :type => Fixnum
  property :date, :type => Date
  property :description, :type => String
  property :name, :type => String  
  property :search, :type => String

  index :amount
  index :search, :type => :fulltext
  has_one :purchase_order
  
  before_validation :build_search
  
  def build_search
    self.search = amount.to_s + " " + description + " " + name
  end
  
end
