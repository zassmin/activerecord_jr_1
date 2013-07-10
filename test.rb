# require_relative 'models/cohort'
# require_relative 'models/student'
require_relative 'app'

# Cohort Tests
puts "COHORT TESTS"
find_cohort = Cohort.find(1)
find_cohort[:name] = 'Best Cohort Ever'
find_cohort.save

Cohort.create(name: "Island Foxes") if Cohort.where('name = ?', 'Island Foxes').count == 0
p Cohort.where('name = ?', 'Island Foxes').count == 1


# This re-queries the database, so we're checking that we actually
# saved the data as intended
puts Cohort.find(1)[:name] == 'Best Cohort Ever'
p where_cohort = Cohort.where('name = ?','Beta').first[:name] == 'Beta'
p Cohort.all.count == 10
puts "Testing that a Cohort has many students"
cohort = Cohort.where('name = ?', 'Best Cohort Ever').first
p cohort.students.count == 218

# Student Tests
puts "STUDENT TESTS"
find_student = Student.find(1)
p find_student[:first_name] == 'Reid'

student = Student.create(first_name: "Zassmin", 
                         last_name: "Apple", 
                         email: 'zass@example.com',
                         gender: 'none', 
                         birthdate: '0000-11-08')
p Student.where('first_name = ?', 'Zassmin').count > 0

puts Student.table_name