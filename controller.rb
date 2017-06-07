require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'

require_relative './models/student'

get '/students' do
  @students = Student.all()
  erb(:index)
end

get '/student/new' do
  erb(:new_student)
end

post '/students' do
  @student = Student.new(params)
  @student.save()
  erb(:create_student)
end