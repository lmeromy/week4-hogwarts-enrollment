require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/student' )
also_reload( './models/*' )


get '/students' do
  @students = Student.find_all()
  erb(:index)
end

get '/students/new' do
  erb(:new)
end

post '/students' do
  @houses = House.find_all()
  @student = Student.new(params)
  @student.save
  redirect '/students'
end
