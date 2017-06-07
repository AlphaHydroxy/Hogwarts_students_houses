require_relative '../db/sql_runner'

class Student
  attr_accessor :id, :first_name, :second_name, :house_id, :age
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @second_name = options['second_name']
    @house_id = options['house_id'].to_i
    @age = options['age'].to_i
  end

  def save()
    sql = "INSERT INTO students (first_name, second_name, house_id, age) VALUES ('#{@first_name}', '#{@second_name}', #{@house_id}, #{@age}) RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def house()
    sql = "SELECT * FROM houses WHERE houses.id = #{@house_id};"
    result = SqlRunner.run(sql)
    return House.new(result.first)   
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

  def find_house()
    sql = "SELECT * FROM houses WHERE houses.id = '#{@house_id}';"
    result = SqlRunner.run(sql)
    return result.first()
  end

  # def student_details()
  #   sql = "SELECT * from students, houses.name FROM students INNER JOIN houses ON students.houses = house.name;"
  # end












end