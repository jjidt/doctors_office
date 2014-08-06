require 'rspec'
require 'patient'
require 'spec_helper'

describe "Patient" do
  it "should create a sickly patient" do
    sick_dude = Patient.new({})
    expect(sick_dude).to be_an_instance_of Patient
  end

  it "should be initialized with some hash" do
    sick_dude = Patient.new({"name" => "Yeah", "birthdate" => "1987-04-04" })
    expect(sick_dude.name).to eq "Yeah"
    expect(sick_dude.birthdate).to eq "1987-04-04"
  end

  it "should allow linkage of patient to doctor" do
    sick_dude = Patient.new({"name" => "Yeah", "birthdate" => "1987-04-04", "doctor_id" => '5'})
    expect(sick_dude.doctor_id).to eq '5'
  end

  describe "save" do
    it "should save a patient to the DB" do
      sick_dude = Patient.new({"name" => "Yeah", "birthdate" => "1987-04-04", "doctor_id" => '5'})
      expect(sick_dude.save).to be_an_instance_of Fixnum
    end
  end

  describe ".all" do
    it "should return all patients in the database" do
      sick_dude = Patient.new({"name" => "Yeah", "birthdate" => "1987-04-04", "doctor_id" => '5'})
      sick_dudette = Patient.new({"name" => "Yeah", "birthdate" => "1987-04-04", "doctor_id" => '5'})
      sick_dude.save
      sick_dudette.save
      expect(Patient.all.length).to eq 2
    end
  end

  describe ".find" do
    it "should return a patient when passed a name" do
      sick_dude = Patient.new({"name" => "Yeah", "birthdate" => "1987-04-04", "doctor_id" => '5'})
      sick_dudette = Patient.new({"name" => "Dudette", "birthdate" => "1987-04-04", "doctor_id" => '5'})
      sick_dude.save
      sick_dudette.save
      expect(Patient.find("Dudette").name).to eq "Dudette"
    end
  end
end
