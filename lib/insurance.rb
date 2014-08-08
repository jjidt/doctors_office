class Insurance < Database

  attr_accessor :name, :id, :table

  @table = 'insurance_companies'

  def initialize(attributes)
    @table = 'insurance_companies'
    @attributes = attributes
    @accessors = [:@name, :@id]
    self.create
  end
end
