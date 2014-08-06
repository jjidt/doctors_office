class Patient

  attr_reader :name, :birthdate, :doctor_id

  def initialize(attributes)
    @name = attributes["name"]
    @birthdate = attributes["birthdate"]
    @doctor_id = attributes["doctor_id"]
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

end
