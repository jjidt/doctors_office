
class Specialty < Database

  attr_reader :name, :id
  @table = 'specialties'

  def initialize(attributes)
    @table = 'specialties'
    @attributes = attributes
    @accessors = [:@name, :@id]
    self.create
  end
end
