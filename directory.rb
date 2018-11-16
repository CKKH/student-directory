def input_students
  # get the first set of student details
  puts "Please enter the name of the student".center(175)
  name = gets.chomp
  puts "Please enter student's favourite programming language".center(175)
  language = gets.chomp
  puts "Please enter student's favourite hobby".center(175)
  hobby = gets.chomp
  # list possible cohorts as symbols in array
  group = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
  puts "Please enter student's cohort".center(175)
  cohort = gets.chomp.capitalize.to_sym
  cohort = :Unknown unless group.include?(cohort)
  # empty overall student array
  students = []
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, language: language, hobby: hobby, cohort: cohort}
    if students.count == 1
      puts "Now we have #{students.count} student".center(175)
    else
      puts "Now we have #{students.count} students".center(175)
    end
    # get next student details from the user unless quit entered
    puts "Please enter the name of the next student, or press enter to finish".center(175)
    name = gets.chomp.downcase
    if name == ""
      break
    else
      puts "Please enter student's favourite programming language".center(175)
      language = gets.chomp
      puts "Please enter student's favourite hobby".center(175)
      hobby = gets.chomp
      puts "Please enter student's cohort".center(175)
      cohort = gets.chomp.capitalize.to_sym
      cohort = :Unknown unless group.include?(cohort)
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
  if students.count == 1
    puts "Overall, we have #{students.count} great student".center(175)
  else
    puts "Overall, we have #{students.count} great students".center(175)
  end
end

students = input_students
# nothing happens until we call the methods
print_header
print_student_details(students)
print_footer(students)
