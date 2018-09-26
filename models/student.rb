require_relative( "../db/sql_runner")
require_relative( "../models/house")

class Student
  attr_reader :id, :firstname, :lastname, :house_id, :age

  def initialize (options)
    @id = options['id'].to_i
    @firstname = options['firstname']
    @lastname = options['lastname']
    @house_id = options['house_id'].to_i
    @age = options['age'].to_i
  end


  def save()
    sql = "INSERT INTO students (firstname, lastname, house_id, age)
    VALUES ($1, $2, $3, $4) RETURNING *"
    values = [@firstname, @lastname, @house_id, @age]
    student_data = SqlRunner.run(sql, values)
    @id = student_data.first()['id'].to_i
  end

  def self.find_all()
    sql = "SELECT * FROM students"
    results = SqlRunner.run(sql)
    return results.map { |student_hash| Student.new(student_hash) }
  end

  def find()
    sql = "SELECT * FROM students WHERE id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    student = Student.new(results.first)
    return student
  end

  def house()
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [@house_id]
    results = SqlRunner.run(sql, values).first
    return House.new(results)
  end

end
