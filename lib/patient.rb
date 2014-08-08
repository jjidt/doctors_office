
class Patient < Database

  attr_reader :name, :birthdate, :doctor_id, :id, :table

  @table = 'patients'
  @sql_columns = {'id' => 'serial PRIMARY KEY', 'name' => 'varchar', 'birthdate' => 'date', 'doctor_id' => 'integer'}


  def initialize(attributes)
    @table = 'patients'
    @attributes = attributes
    @accessors = [:@name, :@birthdate, :@doctor_id, :@id]
    attributes["doctor_id"] = 0 if !attributes["doctor_id"]
    attributes["birthdate"] = '9999-01-01' if !attributes["birthdate"]
    self.create
  end

    def self.create_table
    keys = @sql_columns.keys.join(", ")
    values = @sql_columns.values.join(", ")
    DB.exec("CREATE TABLE patients (#{@sql_columns.partition.to_a.map {|i| i.join(" ")}.join(", ")})")
  end
end
