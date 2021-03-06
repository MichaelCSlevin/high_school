require 'pg'

class SqlRunner

  def self.run(sql, tag, values)
    db = PG.connect({dbname: 'high_school', host: 'localhost'})
    db.prepare(tag, sql)
    result = db.exec_prepared(tag,values)
    db.close
    return result
  end

end
