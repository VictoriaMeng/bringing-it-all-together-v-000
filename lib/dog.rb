class Dog
  attr_accessor :name, :breed, :id

  def initialize(attributes)
    attributes.each { |key, value| self.send("#{key}=", value) }
  end

  def create_table
    sql = <<-SQL
      CREATE TABLE dogs (
        id INTEGER PRIMARY KEY,
        name TEXT,
        breed TEXT
      )
    SQL
    DB[:conn].execute(sql)
  end
end
