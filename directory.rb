# let's put all students into an array
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get enother name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end


def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
  puts " "
end

# Thanks to the following method we can ask to the program to print only the students
# which name starts with a specific letter.
def print_names_starting_with(letter, students)
  puts "List of the students which name starts with #{letter}"
  students.each do |student|
    puts student[:name] if student[:name][0] == letter
  end
  puts " "
end

# Thanks to the following method we can ask to the program to print only the students
# which name is shorter than a specific length.
def print_name_if_length_less_than(students, length)
  puts "List of the students which name is shorter than #{length} characters:"
    students.each do |student|
      puts student[:name] if student[:name].length < length
    end
  puts " "
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_names_starting_with("A", students)
print_name_if_length_less_than(students, 12)
print_footer(students)
