require_relative('../models/student')
require_relative('../models/house')
require('pry-byebug')

house1 = House.new({'name' => 'Gryffindor'})
house1.save()
house2 = House.new({'name' => 'Hufflepuff'})
house2.save()
house3 = House.new({'name' => 'Ravenclaw'})
house3.save()
house4 = House.new({'name' => 'Slytherin'})
house4.save()

student1 = Student.new({'firstname' => 'Ronnie', 'lastname' => 'Weasley', 'house_id' => house1.id, 'age' => 12})
student1.save()
student2 = Student.new({'firstname' => 'Harry', 'lastname' => 'Potter', 'house_id' => house1.id, 'age' => 12})
student2.save()
student3 = Student.new({'firstname' => 'Neville', 'lastname' => 'Longbottom', 'house_id' => house1.id, 'age' => 12})
student3.save()
student4 = Student.new({'firstname' => 'Luna', 'lastname' => 'Lovegood', 'house_id' => house2.id, 'age' => 11})
student4.save()


binding.pry
find_them_all = Student.find_all()
return find_them_all
