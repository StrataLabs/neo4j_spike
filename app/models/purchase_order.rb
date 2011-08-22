class PurchaseOrder < Neo4j::Rails::Model
  property :amount, :type => String
  has_one :bill
end