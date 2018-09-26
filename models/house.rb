require_relative( "../db/sql_runner")

class House
  attr_reader :id, :name

  def initialize (options)
    @id = options['id'].to_i
    @house = options['house']

  end

  def save()
    sql = "INSERT INTO houses (name)
    VALUES ($1) RETURNING *"
    values = [@id]
    house_data = SqlRunner.run(sql, values)
    @id = house_data.first()['id'].to_i
  end

  def self.find_all()
    sql = "SELECT * FROM houses"
    results = SqlRunner.run(sql)
    return results.map { |house_hash| House.new(house_hash) }
  end

  def find()
    sql = "SELECT * FROM house WHERE id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    house = House.new(results.first)
    return house
  end

end
