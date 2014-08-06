class Specialty

  attr_reader :name

  def initialize(attributes)
    @name = attributes["name"]
  end

  def save
    result = DB.exec("INSERT INTO specialties (name) VALUES ('#{@name}') RETURNING id;")
    result.first["id"].to_i
  end
end
