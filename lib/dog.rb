class Dog
  attr_accessor :name, :breed, :id

  def initialize(attributes)
    attributes.each { |key, value| self.send("#{key}=", value) }
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE dogs (
        id INTEGER PRIMARY KEY,
        name TEXT,
        breed TEXT
      )
    SQL
    self.drop_table
    DB[:conn].execute(sql)
  end

  def self.drop_table
    DB[:conn].execute("DROP TABLE IF EXISTS dogs")
  end

  def save
    sql = <<-SQL
      INSERT INTO dogs (name, breed)
      VALUES (name = ?, breed = ?)
    SQL
    DB[:conn].execute(sql, @name, @breed)
    @id = []
  end
end
