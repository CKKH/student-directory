# listing all students as objects in array
students = [
  "Dr Hannibal Lecter",
  "Dart Vadar",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffre Baratheon",
  "Norman Bates"
]
# print student names
puts "The students of Villains Academy"
puts "-------------"

students.each do |student|
  puts student
end

# finally, we print the total number of students
puts "Overall, we have #{students.count} great students"
