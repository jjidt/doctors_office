require 'database'

class Doctor < Database

  attr_reader :name, :specialty_id, :insurance_id
  @table = 'doctors'

  def initialize(attributes)
    @name = attributes["name"]
    attributes.default = 0
    @specialty_id = attributes["specialty_id"]
    @insurance_id = attributes["insurance_id"]
  end

  def save
    results = DB.exec("INSERT INTO doctors (name, specialty_id, insurance_id) VALUES ('#{@name}', '#{@specialty_id}', '#{@insurance_id}') RETURNING id;")
    @id = results.first['id'].to_i
  end
end
