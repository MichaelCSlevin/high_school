require_relative '../db/sql_runner'

class Student

  attr_accessor :id, :name

  def initialize(student_hash)
    @id = student_hash['id'].to_i if student_hash['id']
    @name = student_hash['name']
  end

  def save()
    sql = "INSERT INTO students (name)
    VALUES
    (
      $1
      )
    RETURNING id;
    "
    values = [@name]
    result = SqlRunner.run(sql, "save_student", values)
    @id = result.first['id'].to_i()
  end

  def self.all_students()
    sql = "SELECT * FROM students"
    values = []
    students = sqlRunner.run(sql, values)
    result = students.map {|student| Student.new(student)}
    return result
  end

  def self.delete_all_students()
    sql = "DELETE FROM students"
    values = []
    SqlRunner.run(sql, values)
  end

end
