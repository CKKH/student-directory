def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeart this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  #return the array of input_students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

=begin
def print_student_details(students)
  students.each.with_index(1) do |student, index|
    if student[:name].length < 12
      puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
    else
    end
  end
end
=end

# rewrite the each() print_student_details method using while loop & control flow
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

#def print_student_details(students)
#  counter = 0
#  while counter <= students.count do
#    puts "#{counter + 1}. #{students[:name]} (#{students[:cohort]} cohort)"
#    counter += 1
#  end
#end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
# nothing happens until we call the methods
print_header
print_student_details(students)
print_footer(students)
