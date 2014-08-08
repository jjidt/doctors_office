require './lib/database'
class Doctor < Database

  attr_accessor :name, :specialty_id, :insurance_id, :id, :accessors

  def initialize(attributes)
    @attributes = attributes
    @accessors = [:name, :specialty_id, :insurance_id, :id]
    create(attributes)
  end

  # def save(attributes)
  #   keys = attributes.keys.join(", ")
  #   results = DB.exec("INSERT INTO doctors (#{keys}) VALUES ('#{@name}', '#{@specialty_id}', '#{@insurance_id}') RETURNING id;")
  #   @id = results.first['id'].to_i
  # end
end
