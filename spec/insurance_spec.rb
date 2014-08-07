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

  describe '.delete' do
    it 'deletes an insurance row from the db for a given name' do
      insurance = Insurance.new({"name" => "State Farm"})
      another_insurance = Insurance.new({"name" => "Blue Cross"})
      insurance.save
      another_id = another_insurance.save
      Insurance.delete({"item_id" => another_id})
      expect(DB.exec("SELECT * FROM insurance_companies").first['name']).to eq 'State Farm'
    end
  end
end
