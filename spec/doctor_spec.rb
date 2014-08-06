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

  it 'lets you assign a specialty to a doctor' do
    test_specialty = Specialty.new("ear")
    specialty_id = test_specialty.save.to_s
    test_doctor = Doctor.new({"name" => "who", "specialty_id" => specialty_id})
    test_doctor.save
    expect(Doctor.all.first.specialty_id).to eq specialty_id
  end

  it 'lets you assign a specific insurance company' do
    test_insurance = Insurance.new("Shit Farm")
    insurance_id = test_insurance.save.to_s
    test_doctor = Doctor.new({"name" => "who", "insurance_id" => insurance_id})
    test_doctor.save
    expect(Doctor.all.first.insurance_id).to eq insurance_id
  end

  describe 'save' do
    it 'saves a doctor to the database' do
      test_doctor = Doctor.new({"name" => "who"})
      expect(test_doctor.save).to be_an_instance_of Fixnum
    end
  end

  describe '.find_by_specialty' do
    it 'searches for doctors with a particular specialty' do
      test_specialty = Specialty.new("ear")
      specialty_id = test_specialty.save.to_s
      test_doctor = Doctor.new({"name" => "who", "specialty_id" => specialty_id})
      test_doctor2 = Doctor.new({"name" => "strange", "specialty_id" => specialty_id})
      test_doctor.save
      test_doctor2.save
      expect(Doctor.find(specialty_id).length).to eq 2
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
