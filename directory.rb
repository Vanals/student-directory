# let's put all students into an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLage",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]

puts "The students of Villains Academy"
puts "-------------"
students.each do |student|
  puts student
end
# finally, we print the total number of students
print "Overall, we have #{students.count} great students"
