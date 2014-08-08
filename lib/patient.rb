
class Patient < Database

  attr_reader :name, :birthdate, :doctor_id, :id

  @table = 'patients'

  def initialize(attributes)
    @id = attributes["id"]
    @name = attributes["name"]
    @doctor_id = 0
    @doctor_id = attributes["doctor_id"] if attributes["doctor_id"]
    @birthdate = '9999-01-01'
    @birthdate = attributes["birthdate"] if attributes["birthdate"]
  end

  def save
    result = DB.exec("INSERT INTO patients (name, birthdate, doctor_id) VALUES ('#{@name}', '#{@birthdate}', '#{@doctor_id}') RETURNING id;")
    result.first['id'].to_i
  end
end
