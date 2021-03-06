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
    test_specialty = Specialty.new({"name" => "ear"})
    specialty_id = test_specialty.save.to_s
    test_doctor = Doctor.new({"name" => "who", "specialty_id" => specialty_id})
    test_doctor.save
    expect(Doctor.all.first.specialty_id).to eq specialty_id
  end

  it 'lets you assign a specific insurance company' do
    test_insurance = Insurance.new("name" => "Shit Farm")
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

  describe '.delete' do
    it 'deletes a doctor from the database' do
      test_doctor = Doctor.new({"name" => "who"})
      test_doctor2 = Doctor.new({"name" => "who"})
      test_doctor2.save
      doctor_id = test_doctor.save
      Doctor.delete({"item_id" => doctor_id})
      expect(Doctor.all.length).to eq 1
    end
  end

  describe '.update' do
    it 'updates a doctors info in the database' do
      test_doctor = Doctor.new({"name" => "strange", "specialty_id" => 3})
      test_doctor2 = Doctor.new({"name" => "who"})
      test_doctor2.save
      doctor_id = test_doctor.save
      Doctor.update({"item_id" => doctor_id, "parameters" => 'name', "values" => 'steve'})
      expect(Doctor.find({"column" => "specialty_id", "selector" => 3}).first.name).to eq 'steve'
    end
  end

  describe '.find' do
    it 'searches for doctors with a particular specialty' do
      test_specialty = Specialty.new("ear")
      test_doctor = Doctor.new({"name" => "who", "specialty_id" => 3})
      test_doctor2 = Doctor.new({"name" => "strange", "specialty_id" => 3})
      test_doctor.save
      test_doctor2.save
      expect(Doctor.find({"column" => "specialty_id", "selector" => 3}).length).to eq 2
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
