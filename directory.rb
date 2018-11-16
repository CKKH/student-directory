def input_students
  puts "Please enter the name of the student".center(175)
  # get the first set of student details
  name = gets.chomp
  puts "Please enter student's favourite programming language".center(175)
  language = gets.chomp
  puts "Please enter student's favourite hobby".center(175)
  hobby = gets.chomp
  # create an empty array
  students = []
  # while the name is not empty, repeart this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, language: language, hobby: hobby, cohort: :november}
    puts "Now we have #{students.count} students".center(175)
    # get next student details from the user unless no input entered
    puts "Please enter the name of the next student, or to quit, enter no input".center(175)
    name = gets.chomp
    if name.empty? == true
      break
    else
      puts "Please enter student's favourite programming language".center(175)
      language = gets.chomp
      puts "Please enter student's favourite hobby".center(175)
      hobby = gets.chomp
    end
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
      puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort), favourite programming language: #{student[:language]}, favourite hobby: #{student[:hobby]}".center(175)
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(175)
end

students = input_students
# nothing happens until we call the methods
print_header
print_student_details(students)
print_footer(students)
