require_relative '../db/sql_runner'
require_relative './student'
require_relative './subject'

class Student_Subject

  def initialize(options)
  @id = options['id'].to_i
  @student_id = options['student_id'].to_i
  @subject_id = options['subject_id'].to_i
  end

  def save
    sql = "INSERT INTO student_subject
    (
      student_id,
      subject_id
      )
      VALUES
      (
        $1, $2
      )
      RETURNING id"
      values = [@student_id, @subject_id]
      student_subject = SqlRunner.run(sql, values).first
      @id = student_subject['id'].to_i
    end

    def self.all()
      sql = "SELECT * FROM student_subject"
      values = []
      classes = SqlRunner.run(sql, values)
      result = classes.map { |student_subject| Student_Subject.new( student_subject)}
      return result
    end

    def delete_all
      sql = "DELETE FROM visits"
      values = []
      SqlRunner.run(sql, values)
    end


end
