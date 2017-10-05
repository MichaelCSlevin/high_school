require_relative( '../models/student')
require_relative( '../models/subject')
require_relative( '../models/student_subject')

require( 'pry-byebug' )

student1 = Student.new({ 'name' => 'Spock' })
student1.save()
student2 = Student.new({ 'name' => 'Chekov' })
student2.save()

subject1 = Subject.new({ 'name' => 'Command', 'teacher' => 'Boothby'})
subject1.save()
subject2 = Subject.new({ 'name' => 'Astrophysics', 'teacher' => 'Sisko'})
subject2.save()


student_subject1 = Student_Subject.new({ 'student_id' => student1.id, 'subject_id' => 'subject1_id'})
student_subject1.save()
student_subject2 = Student_Subject.new({ 'student_id' => student2.id, 'subject_id' => 'subject1_id'})
student_subject2.save()
student_subject3 = Student_Subject.new({ 'student_id' => student1.id, 'subject_id' => 'subject2.id'})
student_subject3.save()
binding.pry
nil
