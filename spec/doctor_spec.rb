require 'rspec'
require 'doctor'
require 'spec_helper'

describe 'Doctor' do
  it 'creates a new doctor' do
    test_doctor = Doctor.new({"name" => "who"})
    expect(test_doctor).to be_an_instance_of Doctor
  end

  it 'lets you access the doctors name' do
    test_doctor = Doctor.new({"name" => "who"})
    expect(test_doctor.name).to eq 'who'
  end

  describe 'save' do
    it 'saves a doctor to the database' do
      test_doctor = Doctor.new({"name" => "who"})
      expect(test_doctor.save).to be_an_instance_of Fixnum
    end
  end

  describe '.all' do
    it 'returns all of the doctors in the database' do
      test_doctor = Doctor.new({"name" => "who"})
      test_doctor2 = Doctor.new({"name" => "octagon"})
      test_doctor.save
      test_doctor2.save
      expect(Doctor.all[1].name).to eq "octagon"
    end
  end
end
