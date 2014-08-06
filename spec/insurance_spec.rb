require 'rspec'
require 'spec_helper'
require 'insurance'

describe 'Insurance' do
  it 'creates a new instance of insurance' do
    test_insurance = Insurance.new({"name" => "Shit Farm"})
    expect(test_insurance.name).to eq "Shit Farm"

  end

  describe 'save' do
    it 'saves a new insurance company to the database' do
      test_insurance = Insurance.new({"name" => "Shit Farm"})
      expect(test_insurance.save).to be_an_instance_of Fixnum
    end
  end
end
