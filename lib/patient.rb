class Patient

  attr_reader :name, :birthdate, :doctor_id

  @table = 'patients'

  def initialize(attributes)
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

  def self.all
    patients =[]
    results = DB.exec("SELECT * FROM patients;")
    results.each do |result|
      patients << Patient.new(result)
    end
    patients
  end

  def self.find(name)
    result = DB.exec("SELECT * FROM patients WHERE name = '#{name}'")[0]
    patient = Patient.new(result)
  end

  def self.update(attributes)
    attributes['table'] = @table
    update_item(attributes)
  end

  def self.delete(attributes)
    attributes["table"] = @table
    delete_item(attributes)
  end
end
