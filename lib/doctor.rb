require './lib/database'

class Doctor < Database

  attr_accessor :name, :specialty_id, :insurance_id, :id, :accessors, :table
  @table = 'doctors'

  def initialize(attributes)
    @table = 'doctors'
    @attributes = attributes
    @accessors = [:@name, :@specialty_id, :@insurance_id, :@id]
    self.create
  end
end
