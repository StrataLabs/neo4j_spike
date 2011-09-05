class Account < Neo4j::Rails::Model
  property :name
  index :name
  has_n(:transactions).to(Transaction)
end