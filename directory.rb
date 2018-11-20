require 'csv'

@students = []
@name = ""
@language = ""
@hobby = ""
@cohort = :Unknown

def print_menu
  puts "1. Input student details to records"
  puts "2. Show student records"
  puts "3. Save student records"
  puts "4. Load student records"
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
    when "1" then puts "Entering input student mode..."
      input_new_student_records
    when "2" then puts "Displaying Villains Academy student records..."
      show_student_records
    when "3" then puts "Villains Academy student records saved"
      save_student_records
    when "4" then puts "Villains Academy student records loaded"
      load_student_records
    when "9" then puts "Exiting program..."
      exit
    else puts "I don't know what you meant, try again"
  end
end

def input_new_student_records
  # gets first student name from user or allows them to exit input mode
  request_student_name_or_exit_input_mode
  # if name is provided, repeats this code
  while !@name.empty? do
    # gets student favourite programming language, hobby and cohort from user input
    get_student_info
    # add the student information as hash to the array
    build_student_record
    # print student count after each loop completes
    print_student_count
    # loop continues until user chooses to exit input mode
    request_student_name_or_exit_input_mode
  end
  puts "Exiting input mode..."
end

def show_student_records
  print_header
  print_student_records
  # print_cohort_groups
  print_footer
end

def print_header
  puts "The students of Villains Academy".center(115)
  puts "-------------".center(115)
end

def print_student_records
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

def build_student_record
  @students << {name: @name, language: @language, hobby: @hobby, cohort: @cohort.to_sym}
end

def print_student_count
  puts "We have #{@students.count} great student".center(115) if @students.count == 1
  puts "We have #{@students.count} great students".center(115) if @students.count != 1
end

def save_student_records
  # saves filename based on user input
  filename = student_records_file_name
  # open the file for writing
  CSV.open(filename, "w") do |csv_line|
  # iterate over the array of students, pushing each student record hash into an array
    @students.each do |student|
      student_data = [student[:name], student[:language], student[:hobby], student[:cohort]]
      csv_line << student_data
    end
  end
end

def load_student_records
  # loads filename based on user input
  filename = student_records_file_name
  CSV.foreach(filename) do |line|
    @name, @language, @hobby, @cohort = line
    build_student_record
  end
end

def student_records_file_name
  puts "Please enter student records filename, or press enter to use student_records"
  filename = gets.chomp
  filename == "" ? filename = "student_records.csv" : filename = filename + ".csv"
end

def try_load_students
  if ARGV == nil
    filename = "student_records.csv"
  else
    filename = ARGV.first
  end
  return if filename.nil?
  if File.exists?(filename)
    puts "Loaded #{@students.count} from #{filename}"
    load_students(filename)
  else
    puts "Can't find #{filename} doesn't exist. Loading records from student_records.csv"
    load_students
  end
end



try_load_students
interactive_menu
