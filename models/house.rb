require_relative '../db/sql_runner'

class House
  attr_accessor :id, :name, :logo
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @logo = "./logos/#{@name}.png"
  end

  def save()
    sql = "INSERT INTO houses (name, logo) VALUES ('#{@name}', '#{@logo}') RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM houses;"
    houses = SqlRunner.run(sql)
    return houses.map{ |house| House.new(house)}
  end

  def self.find(id)
    sql = "SELECT * FROM houses WHERE id = #{id};"
    house = SqlRunner.run(sql)
    return House.new(house.first)
  end
end