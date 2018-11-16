def input_students
  puts "Please enter the name of the student".center(175)
  puts "To finish, just hit return twice".center(175)
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeart this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
#hobbies: :coding, country_of_birth: :UK, height: :height
    puts "Now we have #{students.count} students".center(175)
    #get another name from the user
    name = gets.chomp
  end
  #return the array of input_students
  students
end

def print_header
  puts "The students of Villains Academy".center(175)
  puts "-------------".center(175, " ")
end

def print_student_details(students)
  students.each.with_index(1) do |student, index|
    if student[:name].length < 12
      puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)".center(175)
    else
    end
  end
end

=begin
each() print_student_details method using while loop & control flow
def print_student_details(students)
  index_position = 0
  student_array = []
  while index_position <= students.count do
    student_array << students[index_position]
    student_hash = student_array[index_position]
    if student_hash == nil
      break
    else
      puts "#{index_position + 1}. #{student_hash[:name]} (#{student_hash[:cohort]} cohort)"
      index_position += 1
    end
  end
end
=end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(175)
end

students = input_students
# nothing happens until we call the methods
print_header
print_student_details(students)
print_footer(students)

=begin
def request_student_info
  puts "Please enter the name of the student"
  name = gets.chomp
  puts "Please enter their hobbies"
  hobbies = gets.chomp
  puts "Please enter their country of birth"
  country_of_birth = gets.chomp
  puts "Please enter height"
  name = gets.chomp
  puts "To finish, just hit return twice"
end
=end
