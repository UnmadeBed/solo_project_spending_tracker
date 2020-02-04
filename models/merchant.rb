require_relative('../db/sql_runner')
require_relative('./transaction')
require_relative('./tag')

class Merchant
  attr_accessor :name, :location
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @location = options['location']
  end

  def self.delete_all
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO merchants (name, location)
    VALUES($1, $2) RETURNING id"
    values = [@name, @location]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM merchants"
    merchants = SqlRunner.run(sql)
    return merchants.map { |merchant| Merchant.new(merchant) }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [id]
    merchant = SqlRunner.run(sql, values)[0]
    return Merchant.new(merchant)
  end

  def self.delete(id)
    sql = "DELETE FROM merchants WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end





end
