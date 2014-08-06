require 'rspec'
require 'spec_helper'
require 'specialty'

describe 'Specialty' do
  it 'creates a new specialty and initializes with a name' do
    test_specialty = Specialty.new({"name" => "foot"})
    expect(test_specialty.name).to eq "foot"
  end

  describe 'save' do
    it 'saves a specialty to the database and returns the id' do
      test_specialty = Specialty.new({"name" => "foot"})
      expect(test_specialty.save).to be_an_instance_of Fixnum
    end
  end
end
