# Create a global empty array called $students', which will contain all the students information.
$students = []
$months = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
$singular_plural_stud = 'students'

# Let's put all students into an array
def input_students
  puts "\nPlease enter all the information about the student you want to enrol.".upcase
  puts "To finish, just hit return twice\n\n"
  # Get the name of the student.
  puts "Name:"
  name = gets.chomp.capitalize
  name = 'NotGiven' if name.empty?
  # While the name of the next student is not empty, repeat this code
  while !name.empty? do
    # Asking more information about the student(cohort, hobby, country of birth, telephone number)
    puts "\nCohort:"
    cohort = gets.chomp.to_sym
    while !$months.include?(cohort)
      puts "Please write the month correctly:"
      cohort = gets.chomp.to_sym
    end
    puts "\nHobby:"
    hobby = gets.chomp
    hobby = 'NotGiven' if hobby.empty?
    puts "\nCountry of birth:"
    country = gets.chomp
    country = 'NotGiven' if country.empty?
    puts "\nTelephone number:"
    telephone = gets.chomp
    telephone = 'NotGiven' if telephone.empty?
    # Add the student hash to the array
    $students << {name: name, cohort: cohort, hobby: hobby, country: country, telephone: telephone }
    puts "----------".center(50)
    # Change the value of 'singular_plural_stud' global variable, in base of how many students have been enrolled.
    $singular_plural_stud = 'student' if $students.count == 1
    puts "Student enrolled. Now we have #{$students.count} #{$singular_plural_stud}".center(50).upcase
    # Get the name of the next student if chosen or finish the enrolment.
    puts "\nWrite the name of the next student you want to enrol:".upcase
    #If the user just pres return, without typing any name, the while loop will stop.
    puts "To finish and go back to the MENU, just hit return.\n"
    name = gets.chomp.capitalize
  end
  # Return the array of students
end

# This method allow us to correct the name of a student that has been enrolled.
def correction_name
  students_list_empty
  puts "CORRECTION NAME\n"
  puts "Which name do you want to correct?"
  wrong_name = gets.chomp
  puts "What is the new name?"
  new_name = gets.chomp
  $students.each do |student|
    #If the name of a students is equal to what the user said, i will be replaced by the newone.
    if student[:name] == wrong_name
      student[:name] = new_name
      puts "\nName of the student #{wrong_name} changed in #{new_name} \n".upcase
      continue
      interactive_menu
    end
  end
end

# This method give us more information about a student, like: telephone number, country of birth, hobby.
def more_info_about_student
  students_list_empty
  puts "Who is the student you want to know more about?".upcase
  name = gets.chomp
  $students.each do |student|
    if student[:name] == name
      puts "\n-#{name} was born in #{student[:country]}, its hobby is #{student[:hobby]}"
      puts "and its telephone number is #{student[:telephone]}."
      continue
      interactive_menu
    end
  end
end

# 'print()' print out the list of the enrolled students.
def print_stud
  students_list_empty
  hash_index = 0
  list_position = 1
  while hash_index < $students.count
    puts "#{list_position}. #{$students[hash_index][:name]} (#{$students[hash_index][:cohort]} cohort)\n"
    hash_index += 1
    list_position += 1
  end
end

# print_by_cohort() prints out the list of the enrolled students grouped by cohort.
def print_by_cohort
  students_list_empty
  puts "The students of Villains Academy grouped by cohort".upcase.center(50)
  puts "-------".center(50)
  months_index = 0
  list_position = 1
  while months_index < 12
    $students.each do |student|
      if student[:cohort] == $months[months_index]
        puts "#{list_position}. #{student[:name]} (#{student[:cohort]} cohort)\n"
        list_position += 1
      end
    end
    months_index += 1
  end
end

# Thanks to the following method we can ask to the program to print only the students
# which name starts with a specific letter.
def print_names_starting_with
  students_list_empty
  puts "Write the letter which the names of the students have to start with:"
  letter = gets.chomp.upcase
  puts "\nList of the students which name starts with the letter '#{letter}'\n".center(50, '-').upcase
  list_position = 1
  $students.each do |student|
    if student[:name][0] == letter
      puts "#{list_position}. #{student[:name]} (#{student[:cohort]} cohort)"
      list_position += 1
    end
  end
  continue
end

# Thanks to the following method we can ask to the program to print only the students
# which name is shorter than a specific length.
def print_name_if_length_less_than
  students_list_empty
  puts "The names have to be shorter than?"
  length = gets.chomp
  puts "\nList of the students which name is shorter than #{length} characters:\n".upcase.center(50)
    $students.each do |student|
      puts student[:name] if student[:name].length < length.to_i
    end
  continue
end

def save_students
  students_list_empty
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  $students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "The list of students has been saved.".upcase.center(50)
  continue
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
      $students << {name: name, cohort: cohort.to_sym}
    end
  file.close
  puts "The list of students has been load.".upcase
  continue
end

private


def print_header
  puts "The students of Villains Academy".center(50).upcase
  puts "--------------".center(50)
end

def print_footer
  puts "--------------".center(50)
  puts "Overall, we have #{$students.count} great #{$singular_plural_stud}\n".center(50)
end

def continue
  puts "\nTo continue and go back to the MENU, press enter."
  gets
end

def students_list_empty
  if $students.empty?
    puts "The list of students is empty".upcase
    continue
    interactive_menu
  end
end

def print_menu
  puts "COMANDS MENU OF VILLAINS ACADEMY".center(50, '-')
  puts "by @Vanals directory Company".center(50)
  puts " "
  puts "Choose the corrisponding number to the command, write it and then press enter for doing what you desire:\n \n".center(50)
  puts "0. EXIT = Interrupt the program"
  puts "1. SIGN UP = Enrols new students in the Villains Accademy"
  puts "2. CORRECTION NAME = Changes the name of an enrolled student."
  puts "3. INFO ABOUT = Prints into the screen information about a student of your choice."
  puts "4. PRINT LIST = Prints into the screen the list of all the enrolled students."
  puts "5. PRINT LIST BY COHORT = Prints into the screen the list of all the enrolled students grouped by cohort."
  puts "6. PRINT STUDENTS NAME STARTING WITH = Prints into the screen the list of all the enrolled students which name start with a letter of your choice.'"
  puts "7. PRINT STUDENTS NAME LESS LENGTH THAN = Print into the screen the list of all the enrolled students wich name is shorter than an amount of your choice."
  puts "8. SAVE THE LIST TO STUDENTS.CSV = Save the list of students in the file students.csv."
  puts "9. LOAD THE LIST FROM STUDENTS.CSV = Load the list of the enrolled students from the file  'students.csv'"
  puts "\nWrite the corrisponding number and then press enter:"
  puts "> "
end

def show_students
  print_header
  print_stud
  print_footer
  continue
end

def show_students_by_cohort
  print_by_cohort
  print_footer
  continue
end

def process(selection)
  case selection
    when "0" then exit(0)
    when "1" then input_students
    when "2" then correction_name
    when "3" then more_info_about_student
    when "4" then show_students
    when "5" then show_students_by_cohort
    when "6" then print_names_starting_with
    when "7" then print_name_if_length_less_than
    when "8" then save_students
    when "9" then load_students
    else
      puts "This command doesn't exist. Write the command correctly. Press enter to go back to the MENU"
      continue
  end
end

def interactive_menu
  loop do
    print_menu
    user_comand = gets.chomp
    process(user_comand)
  end
end


interactive_menu


#EX 11 and 10 to do.

=begin
aggiorna i tuoi file con le cose nuove che hai usato.. comandi etc.. .
command to delete a student from the list
Ogni comand ha continue?
Quelli che ne hanno bisogno checkano se la students global variable è empry?
Cambia correction name and more info method da each a while/UNTIl per poter inserire un messaggio di error enel caso non sitrovi nessuno studente.
sistema aspetto comando 6 e 7, rispetto a 4 e 5 son molto anonimi e quasi confusi.
=end
