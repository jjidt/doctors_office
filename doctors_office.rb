require 'pg'
require 'pry'
require './lib/UD'
require './lib/database'
require './lib/doctor'
require './lib/patient'
require './lib/specialty'
require './lib/insurance'

DB = PG.connect({:dbname => 'doctors_office'})

def prompt(string)
  puts string
  print ">"
  gets.chomp
end

user_classes = [:Doctor, :Patient, :Specialty, :Insurance]
crud_options = {"delete" => :delete, "update" => :update, "list all" => :all, "find" => :find}
crud_parameters = {:delete => ["item_id"], :update => ["item_id", "parameters", "values"], :find => ["column", "selector"]}


def access(user_classes, crud_options, crud_parameters)
  system('clear')
  user_classes.each_with_index do |user_class, index|
    puts "#{index + 1}:  #{user_class.to_s}"
  end
  user_choice = prompt("Enter number of choice to access")
  current_class = user_classes[user_choice.to_i - 1]
  crud_keys = crud_options.keys
  crud_keys.each_with_index do |crud_option, index|
    puts "#{index + 1}:  #{crud_option}"
  end
  crud_choice = prompt("Enter a number to perform function on #{current_class}")
  current_crud = crud_options[crud_keys[crud_choice.to_i - 1]]
  current_grab = Kernel.const_get(current_class).send(current_crud)
  current_grab.each do |item|
    print "\n"
    grab_instances = item.instance_variables
    grab_instances.each do |instance|
      instance = instance.to_s.gsub(/@/, '').to_sym
      print "#{instance}:  #{item.send(instance)}\t"
    end
  puts "\n"
  end
end

access(user_classes, crud_options, crud_parameters)
