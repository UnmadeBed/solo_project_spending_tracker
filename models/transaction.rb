require_relative('../db/sql_runner')
require_relative('./merchant')
require_relative('./tag')

class Transaction

  attr_accessor :amount, :merchant_id, :tag_id
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @amount = options['amount']
    @merchant_id = options['merchant_id']
    @tag_id = options['tag_id']
  end

  #does this work?
  def save()
    sql = "INSERT INTO transactions (amount, merchant_id, tag_id)
    VALUES ($1, $2, $3)
    RETURNING id"
    values = [@amount, @merchant_id, @tag_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  #does this work?
  def self.all()
    sql = "SELECT * FROM transactions"
    transactions = SqlRunner.run(sql)
    return transactions.map { |transaction| Transaction.new(transaction) }
  end

  #does this work?
  def self.find_by_id(id)
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [id]
    transaction = SqlRunner.run(sql, values)[0]
    return Transaction.new(transaction)
  end

  def update()
    sql = "UPDATE transactions SET(amount, merchant_id, tag_id) = ($1, $2, $3) WHERE id = $4"
    values = [@amount, @merchant_id, @tag_id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  def delete(id)
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end





  #total method example.
 #  def Transaction.total()
 #   sql = "SELECT sum(amount)
 #   FROM transactions"
 #   total = SqlRunner.run(sql)
 #   return total.values.first.first.to_f.round(2)
 # end


end
