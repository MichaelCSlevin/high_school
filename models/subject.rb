require_relative '../db/sql_runner'

class Subject

  attr_accessor :id, :name, :teacher
  attr_reader :id

  def initialize (subject_hash)
    @id = subject_hash['id'].to_i if subject_hash ['id']
    @name = subject_hash['name']
    @teacher = subject_hash['teacher']
  end

  def save
    sql = "INSERT INTO subjects
    (
      name,
      teacher
    ) VALUES
      (
        $1, $2
        )
      RETURNING id"
    values  = [@name, @teacher]
    result = SqlRunner.run(sql, "save_subject", values)
    @id = result.first['id'].to_i()
  end

  def self.all_subjects()
        sql = "SELECT * FROM subjects"
        values = []
        subjects  = SqlRunner.run(sql, values)
        result = subjects.map {|subject| Subject.new(subject)}
        return result
      end

    def self.delete_all()
      sql = "DELETE FROM subjects"
      values = []
      SqlRunner.run(sql, values)
    end



end
