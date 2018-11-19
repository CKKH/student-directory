@students = []
@name = ""
@language = ""
@hobby = ""
@cohort = :Unknown

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1" then input_students
    when "2" then show_students
    when "3" then save_students
    when "4" then load_students
    when "9" then exit
    else puts "I don't know what you meant, try again"
  end
end

def input_students
  # gets first student name from user or allows them to exit input mode
  request_student_name_or_exit_input_mode
  # if name is provided, repeats this code
  while !@name.empty? do
    # gets student favourite programming language, hobby and cohort from user input
    get_student_info
    # add the student information as hash to the array
    build_student_list
    # print student count after each loop completes
    print_student_count
    # loop continues until user chooses to exit input mode
    request_student_name_or_exit_input_mode
  end
end

def show_students
  print_header
  print_student_details
  # print_cohort_groups
  print_footer
end

def print_header
  puts "The students of Villains Academy".center(115)
  puts "-------------".center(115)
end

def print_student_details
  if !@students.empty?
    @students.each.with_index(1) do |student, index|
      puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort), favourite programming language: #{student[:language]}, favourite hobby: #{student[:hobby]}".center(115)
    end
  else puts "No student information available".center(115)
  end
end

def print_cohort_groups
  cohort_groups = @students.map { |student| student[:cohort] }.uniq
  cohort_groups.each do |cohort|
    puts "#{cohort} cohort: ".center(115)
    @students.each do |student|
      puts student[:name].center(115) if student[:cohort] == cohort
    end
  end
end

def print_footer
  puts "-------------".center(115)
  puts print_student_count
end

def request_student_name_or_exit_input_mode
  puts "Please enter student's name, or press enter to finish".center(115)
  @name = STDIN.gets.chomp
end

def get_student_info
  puts "Please enter student's favourite programming language".center(115)
  @language = STDIN.gets.chomp
  puts "Please enter student's favourite hobby".center(115)
  @hobby = STDIN.gets.chomp
  # list possible cohorts as symbols in array
  cohort_groups = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
  puts "Please enter student's cohort".center(115)
  @cohort = STDIN.gets.chomp.capitalize.to_sym
  @cohort = :Unknown unless cohort_groups.include?(@cohort)
end

def build_student_list
  @students << {name: @name, language: @language, hobby: @hobby, cohort: @cohort.to_sym}
end

def print_student_count
  puts "We have #{@students.count} great student".center(115) if @students.count == 1
  puts "We have #{@students.count} great students".center(115) if @students.count != 1
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:language], student[:hobby], student[:cohort]]
    csv_line = student_data.join(", ")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, language, hobby, cohort = line.chomp.split(',')
    build_student_list
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu
