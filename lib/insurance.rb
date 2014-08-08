
class Insurance < Database

  attr_reader :name, :id

  @table = 'insurance_companies'

  def initialize(attributes)
    @id = attributes["id"]
    @name = attributes["name"]
  end

  def save
    result = DB.exec("INSERT INTO insurance_companies (name) VALUES ('#{@name}') RETURNING id;")
    id = result.first["id"].to_i
  end
end
