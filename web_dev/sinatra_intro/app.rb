# require gems
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sqlite3'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a GET route
# that displays an address
get '/contact' do 
  "<p>123 Main St.</p>\n <p>San Diego, CA</p>"
end

#write a GET route that takes a query parameter
# if query param not present, say Good job!

get '/great_job' do 
  name = params[:name]
  if name
    "Good job, #{name}!"
  else 
    "Good job!"
  end
end

#write a route that uses route parameters to add
#two numbers and respond with result
get '/add/:num1/:num2' do 
  num1 = params[:num1].to_i
  num2 = params[:num2].to_i
  result = num1 + num2 
  "#{num1} + #{num2} = #{result}"
end

# bonus: write a route that allows user to search db
get '/students/search' do 
  campus = params["campus"]
  if campus
    students = db.execute("SELECT * FROM students WHERE campus='#{campus}'")
    response = ''
    students.each do |student|
      response += "<p>#{student['name']}</p>"
    end
    response
  else 
    "Please enter a campus to search."
  end
end


# write a basic GET route
# add a query parameter
# GET /
get '/' do
  "#{params[:name]} is #{params[:age]} years old."
end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

# write a GET route that retrieves
# all student data
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end

=begin 

RESEARCH 

1. Is Sinatra the only web app library in Ruby? 
What are some others?
-Ruby on Rails
-Merb
-Nitro
-Camping

2. Are SQLite and the sqlite3 gem your only options 
for using a database with Sinatra? What are some others?
-Active Record
-Mongo

3. What is meant by the term web stack?
A web stack is a collection of software required for
web development.
-OS
-programming language
-database sofware
-web sever


=end