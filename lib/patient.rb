
class Patient < Database

  attr_reader :name, :birthdate, :doctor_id, :id, :table

  @table = 'patients'

  def initialize(attributes)
    @table = 'patients'
    @attributes = attributes
    @accessors = [:@name, :@birthdate, :@doctor_id, :@id]
    attributes["doctor_id"] = 0 if !attributes["doctor_id"]
    attributes["birthdate"] = '9999-01-01' if !attributes["birthdate"]
    self.create
  end
end
