class Insurance

  attr_reader :name
  @table = 'insurance_companies'

  def initialize(attributes)
    @name = attributes["name"]
  end

  def save
    result = DB.exec("INSERT INTO insurance_companies (name) VALUES ('#{@name}') RETURNING id;")
    id = result.first["id"].to_i
  end

  def self.delete(attributes)
    attributes['table'] = @table
    delete_item(attributes)
  end
end
