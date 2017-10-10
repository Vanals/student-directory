# let's put all students into an array
def input_students
  puts "Please enter all the information about the student you want to enrol."
  puts "To finish, just hit return twice\n\n"
  # create an empty array
  students = []
  # get the name of the student.
  puts "Name:"
  name = gets.chomp
  name = 'NotGiven' if name.empty?

  # while the name of the next student is not empty, repeat this code
  while !name.empty? do
    # Asking more information about the student(cohort, hobby, country of birth, telephone number)
    puts "\nCohort:"
    months = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
    cohort = gets.chomp.to_sym
    while !months.include?(cohort)
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

    # add the student hash to the array
    students << {name: name, cohort: cohort, hobby: hobby, country: country, telephone: telephone }
    puts "----------".center(50)
    $singular_plural_stud = 'students'
    $singular_plural_stud = 'student' if students.count == 1
    puts "Student enrolled. Now we have #{students.count} #{$singular_plural_stud}".center(50)
    # get the name of the next student if chosen or finish the enrolment.
    puts "\nWrite the name of the next student you want to enrol:"
    #If the user just pres return, without typing any name, the while loop will stop.
    puts "To finish, just hit return.\n"
    name = gets.chomp
  end
  # return the array of students
  students
end

def correction_name(students, wrong_name, new_name)
  students.each do |student|
    if student[:name] == wrong_name
      student[:name] = new_name
      puts "Name of the student #{wrong_name} changed in #{new_name} \n"
    end
  end
end

def more_info_about_student(students, name)
  students.each do |student|
    if student[:name] == name
      puts "#{name} was born in #{student[:country]}, its hobby is #{student[:hobby]}"
      puts "and its telephone number is #{student[:telephone]}."
    end
  end
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "--------------".center(50)
end

def print(students)
  hash_index = 0
  list_position = 1
  while hash_index < students.count
    puts "#{list_position}. #{students[hash_index][:name]} (#{students[hash_index][:cohort]} cohort)\n"
    hash_index += 1
    list_position += 1
  end
end

def print_by_cohort(students)
  months = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
  months_index = 0
  list_position = 1
  while months_index < 12
    students.each do |student|
      if student[:cohort] == months[months_index]
        puts "#{list_position}. #{student[:name]} (#{student[:cohort]} cohort)\n"
        list_position += 1
      end
    end
    months_index += 1
  end
end

# Thanks to the following method we can ask to the program to print only the students
# which name starts with a specific letter.
def print_names_starting_with(letter, students)
  puts "-List of the students which name starts with the letter '#{letter}':\n"
  students.each do |student|
    puts student[:name] if student[:name][0] == letter
  end
  puts " "
end

# Thanks to the following method we can ask to the program to print only the students
# which name is shorter than a specific length.
def print_name_if_length_less_than(students, length)
  puts "-List of the students which name is shorter than #{length} characters:\n"
    students.each do |student|
      puts student[:name] if student[:name].length < length
    end
  puts " "
end

def print_footer(names)
  puts "--------------".center(50)
  puts "Overall, we have #{names.count} great #{$singular_plural_stud}".center(50)
end

#TEST COMMANDS ----------- TEST COMMANDS
students = input_students
print_header
print(students)
print_names_starting_with("A", students)
print_name_if_length_less_than(students, 12)
print_footer(students)

puts "   "
more_info_about_student(students, "Marco")
correction_name(students, 'Macro', 'Marco')
print(students)
puts " "
puts "List printed by order"
print_by_cohort(students)
