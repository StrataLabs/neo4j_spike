namespace :benchmark do
  task :clean => :environment do
    Neo4j::Transaction.run do
      Neo4j._all_nodes.each { |n| n.del unless n.neo_id == 0 }
    end
  end

  task :data_counts => :environment do
    [Account, Transaction].each do |klass|
      puts "#{klass.name} Count : #{klass.count}"
    end
  end

  task :create_data => :environment do
    account = Account.find(:name => "test") || Account.create!(:name => "test")

    Benchmark.bm do |x|
      x.report("Create transactions") do
        Account.transaction do
          (1..10000).each  do |i|
            account.transactions.create(:amount => i, :date => (Date.today + i.days))
          end
        end
      end
    end
  end

  task  :range_query => :data_counts do
    account = Account.find(:name => "test") || Account.create!(:name => "test")
    query_range = (Date.today+8000.days..Date.today + 8500.days)
    result_size = 0

    Benchmark.bm do |x|
      x.report("TransQuery") do
        result_size = Transaction.all(:date => query_range).asc(:date).collect(&:date).size
      end

      puts "Result size :#{result_size}"

      x.report("AccRelQuerySort") do
        trans = account.transactions.find_all { |trans| query_range.include?(trans.date) }
        result_size = trans.sort_by(&:date).size
      end

      puts "Result size :#{result_size}"
    end
  end

  task  :range_aggregate => :data_counts do
    account = Account.find(:name => "test") || Account.create!(:name => "test")
    query_range = (Date.today+8000.days..Date.today + 8500.days)

    Benchmark.bm do |x|
      total = 0
      x.report("QueryTotalJavaObj") do
        trans = account.outgoing("Transaction#transactions"
                            ).each { |trans| total += trans[:amount] if query_range.include?(trans[:date]) }
      end
      puts "Result Total :#{total}"

      total = 0
      x.report("QueryTotalRubyObj") do
        trans = account.transactions.each { |trans| total += trans[:amount] if query_range.include?(trans.date) }
      end

      puts "Result Total :#{total}"
    end
  end
end