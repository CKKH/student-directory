@students = [] # empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  # get the first set of student details
  puts "Please enter the name of the next student, or press enter to finish".center(175)
  name = gets.chomp
  # while name is not empty, repeat this code
  while !name.empty? do
    puts "Please enter student's favourite programming language".center(175)
    language = gets.chomp
    puts "Please enter student's favourite hobby".center(175)
    hobby = gets.chomp
    # list possible cohorts as symbols in array
    cohort_groups = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
    puts "Please enter student's cohort".center(175)
    cohort = gets.chomp.capitalize.to_sym
    cohort = :Unknown unless cohort_groups.include?(cohort)
    # add the student hash to the array
    @students << {name: name, language: language, hobby: hobby, cohort: cohort}
    if @students.count == 1
      puts "Now we have #{@students.count} student".center(175)
    else
      puts "Now we have #{@students.count} students".center(175)
    end
    # get next student details from the user unless quit entered
    puts "Please enter the name of the next student, or press enter to finish".center(175)
    name = gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy".center(175)
  puts "-------------".center(175)
end

def print_student_details
  if !@students.empty?
    @students.each.with_index(1) do |student, index|
      puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort), favourite programming language: #{student[:language]}, favourite hobby: #{student[:hobby]}".center(175)
    end
  else
    puts "No student information available".center(175)
  end
 end

def print_cohort_groups
  cohort_groups = @students.map { |student| student[:cohort] }.uniq
  cohort_groups.each do |cohort|
    puts "#{cohort} cohort: ".center(175)
    @students.each do |student|
      if student[:cohort] == cohort
        puts student[:name].center(175)
      end
    end
  end
end

def print_footer
  puts "-------------".center(175)
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student".center(175)
  else
    puts "Overall, we have #{@students.count} great students".center(175)
  end
end

def show_students
  print_header
  print_student_details
  # print_cohort_groups
  print_footer
end

interactive_menu
