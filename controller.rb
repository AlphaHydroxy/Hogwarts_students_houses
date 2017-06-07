require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'

require_relative './models/student'
require_relative './models/house'

get '/students' do
  @students = Student.all()
  erb(:index)
end

get '/student/new' do
  @houses = House.all()
  erb(:new_student)
end

post '/students' do
  @student = Student.new(params)
  @student.save()
  erb(:create_student)
end
