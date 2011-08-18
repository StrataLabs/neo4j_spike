class Bill < Neo4j::Rails::Model
  property :amount, :type => String
  has_one :purchase_order
  
end
