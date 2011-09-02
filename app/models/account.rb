class Account < Neo4j::Rails::Model
  property :name
  index :name
  has_n(:incurs).to(Transaction)
end