require_relative('../db/sql_runner')
require_relative('./merchant')
require_relative('./transaction')

class Tag
  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def self.delete_all
    sql = "DELETE FROM tags"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO tags (name)
    VALUES($1) RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM tags"
    tags = SqlRunner.run(sql)
    return tags.map { |tag| Tag.new(tag) }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM tags WHERE id = $1"
    values = [id]
    tags = SqlRunner.run(sql, values)[0]
    return Tag.new(tag)
  end

  def self.delete(id)
    sql = "DELETE FROM tags WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end



end
