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
      expect(Patient.find({"column" => "name", "selector" => "'Dudette'"}).first.name).to eq 'Dudette'
    end
  end

  describe '.update' do
    it 'updates patient information' do
      patient1 = Patient.new({})
      patient2 = Patient.new({})
      patient2.save
      id_1 = patient1.save
      Patient.update({"item_id" => id_1, "parameters" => 'name', "values" => 'steve'})
      expect(Patient.find({"column" => "name", "selector" => "'steve'"}).first.name).to eq 'steve'
    end
  end

  describe '.delete' do
    it 'deletes a patient from the database' do
      sick_dude = Patient.new({"name" => "Yeah", "birthdate" => "1987-04-04", "doctor_id" => '5'})
      sick_dudette = Patient.new({"name" => "dudette", "birthdate" => "1987-04-04", "doctor_id" => '5'})
      sick_dude.save
      id_dudette = sick_dudette.save
      Patient.delete({"item_id" => id_dudette})
      expect(Patient.all.first.name).to eq "Yeah"
    end
  end
end
