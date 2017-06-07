require_relative '../db/sql_runner'

class Student
  attr_accessor :id, :first_name, :second_name, :house, :age
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @second_name = options['second_name']
    @house = options['house']
    @age = options['age'].to_i
  end

  def save()
    sql = "INSERT INTO students (first_name, second_name, house, age) VALUES ('#{@first_name}', '#{@second_name}', '#{@house}', #{@age}) RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM students;"
    students = SqlRunner.run(sql)
    return students.map{ |student| Student.new(student) }
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = #{id};"
    student = SqlRunner.run(sql)
    result = Student.new(student.first)
    return result
  end
end