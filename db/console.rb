require_relative '../models/student'
require_relative '../models/house'
require 'pry-byebug'

student1 = Student.new({
    'first_name' => 'Harry',
    'second_name' => 'Potter',
    'house' => 'Gryffindor',
    'age' => 12
  })
student1.save()

student2 = Student.new({
    'first_name' => 'Jia',
    'second_name' => 'Wong',
    'house' => 'Slytherin',
    'age' => 21
  })
student2.save()

student3 = Student.new({
    'first_name' => 'Stuart',
    'second_name' => 'Bryce',
    'house' => 'Slytherin',
    'age' => 103
  })
student3.save()

house1 = House.new({
  'name' => 'Gryffindor'
  })
house1.save()

house2 = House.new({
  'name' => 'Slytherin'
  })
house2.save()

house3 = House.new({
  'name' => 'Hufflepuff'
  })
house3.save()

house4 = House.new({
  'name' => 'Ravenclaw'
  })
house4.save()



binding.pry
nil