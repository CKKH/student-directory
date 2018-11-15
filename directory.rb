# listing all students as objects in array
students = [
  ["Dr Hannibal Lecter", :november],
  ["Dart Vadar", :november],
  ["Nurse Ratched", :november],
  ["Michael Corleone", :november],
  ["Alex DeLarge", :november],
  ["The Wicked Witch of the West", :november],
  ["Terminator", :november],
  ["Freddy Krueger", :november],
  ["The Joker", :november],
  ["Joffre Baratheon", :november],
  ["Norman Bates", :november]
]
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print_student_details(students)
  students.each do |student|
    puts "#{student[0]} (#{student[1]} cohort)"
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
# nothing happens until we call the methods
print_header
print_student_details(students)
print_footer(students)
