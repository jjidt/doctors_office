require 'pg'
require 'pry'
require 'UD'
require 'rspec'
require './lib/insurance'
require './lib/patient'
require './lib/specialty'

DB = PG.connect({:dbname => 'postgres'})
Database.new('doctors_office')
DB = PG.connect({:dbname => 'doctors_office_test'})

DB.exec("drop schema public cascade; create schema public;")

Doctor.create_table
Insurance.create_table
Patient.create_table
Specialty.create_table

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctors *;")
    DB.exec("DELETE FROM patients *;")
    DB.exec("DELETE FROM specialties *;")
    DB.exec("DELETE FROM insurance_companies *;")
  end
end
