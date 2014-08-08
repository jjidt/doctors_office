require './lib/database'

class Doctor < Database

  attr_accessor :name, :specialty_id, :insurance_id, :id, :accessors, :table
  @table = 'doctors'
  @sql_columns = {'id' => 'serial PRIMARY KEY', 'name' => 'varchar', 'specialty_id' => 'integer', 'insurance_id' => 'integer'}

  def initialize(attributes)
    @table = 'doctors'
    @attributes = attributes
    @accessors = [:@name, :@specialty_id, :@insurance_id, :@id]
    self.create
  end

  def self.create_table
    keys = @sql_columns.keys.join(", ")
    values = @sql_columns.values.join(", ")
    DB.exec("CREATE TABLE doctors (#{@sql_columns.partition.to_a.map {|i| i.join(" ")}.join(", ")})")
  end

end




