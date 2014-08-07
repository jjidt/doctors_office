class Specialty

  attr_reader :name
  @table = 'specialties'

  def initialize(attributes)
    @name = attributes["name"]
  end

  def save
    result = DB.exec("INSERT INTO specialties (name) VALUES ('#{@name}') RETURNING id;")
    result.first["id"].to_i
  end

  def self.delete(attributes)
    attributes['table'] = @table
    delete_item(attributes)
  end
end
