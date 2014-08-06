class Doctor

  attr_reader :name

  def initialize(attributes)
    @name = attributes["name"]
  end

  def save
    results = DB.exec("INSERT INTO doctors (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def self.all
    doctors = []
    results = DB.exec("SELECT * FROM doctors;")
    results.each do |result|
      doctors << Doctor.new(result)
    end
    doctors
  end
end
