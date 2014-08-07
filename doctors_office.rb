require 'pg'
require 'pry'
require './lib/UD'

DB = PG.connect({:dbname => 'doctors_office'})

def prompt(string)
  puts string
  print ">"
  gets.chomp
end

user_classes = [:Doctor, :Patient, :Specialty, :Insurance]
crud_options = [:delete, :update, :all, :find]

def access(user_classes, crud_options)
  user_classes.each_with_index do |user_class, index|
    puts "#{index + 1}:  #{user_class.to_s}"
  end
  user_choice = prompt("Enter number of choice to access")
  current_class = user_classes[user_choice.to_i - 1]
  crud_options.each_with_index do |crud_option, index|
      puts "#{index + 1}:  #{crud_option.to_s}"
  end
  crud_choice = prompt("Enter a number to perform function on #{current_class}")
  current_crud = crud_options[crud_choice.to_i -1]
  current_class.current_crud("")
end

access(user_classes, crud_options)





  # @table_list = []
  # results = DB.exec("SELECT table_name FROM information_schema.tables WHERE table_schema='public' AND table_type = 'BASE TABLE'")
  # results.each {|result| @table_list << result["table_name"]}
