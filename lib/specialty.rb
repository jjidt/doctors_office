
class Specialty < Database

  attr_reader :name, :id
  @table = 'specialties'
  @sql_columns = {'id' => 'serial PRIMARY KEY', 'name' => 'varchar'}


  def initialize(attributes)
    @table = 'specialties'
    @attributes = attributes
    @accessors = [:@name, :@id]
    self.create
  end

  def self.create_table
    keys = @sql_columns.keys.join(", ")
    values = @sql_columns.values.join(", ")
    DB.exec("CREATE TABLE specialties (#{@sql_columns.partition.to_a.map {|i| i.join(" ")}.join(", ")})")
  end
end
