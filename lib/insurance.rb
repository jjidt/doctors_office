class Insurance < Database

  attr_accessor :name, :id, :table

  @table = 'insurance_companies'
  @sql_columns = {'id' => 'serial PRIMARY KEY', 'name' => 'varchar'}

  def initialize(attributes)
    @table = 'insurance_companies'
    @attributes = attributes
    @accessors = [:@name, :@id]
    self.create
  end

  def self.create_table
    keys = @sql_columns.keys.join(", ")
    values = @sql_columns.values.join(", ")
    DB.exec("CREATE TABLE insurance_companies (#{@sql_columns.partition.to_a.map {|i| i.join(" ")}.join(", ")})")
  end
end
