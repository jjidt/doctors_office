require 'database'

class Specialty < Database

  attr_reader :name
  @table = 'specialties'

  def initialize(attributes)
    @name = attributes["name"]
  end

  def save
    result = DB.exec("INSERT INTO specialties (name) VALUES ('#{@name}') RETURNING id;")
    result.first["id"].to_i
  end
end
