class Transaction < Neo4j::Rails::Model
  property :amount, :type => Fixnum
  property :date, :type => Date
  index :amount
  index :date
end