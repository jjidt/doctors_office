require './lib/database'
class Doctor < Database

  attr_accessor :name, :specialty_id, :insurance_id, :id, :accessors
  @table = 'doctors'

  def initialize(attributes)
    @attributes = attributes
    @name = @specialty_id = @insurance_id = @id = 0
    accessors = [:@name, :@specialty_id, :@insurance_id, :@id]
    create(attributes, accessors)
  end

  # def save(attributes)
  #   keys = attributes.keys.join(", ")
  #   results = DB.exec("INSERT INTO doctors (#{keys}) VALUES ('#{@name}', '#{@specialty_id}', '#{@insurance_id}') RETURNING id;")
  #   @id = results.first['id'].to_i
  # end
end
