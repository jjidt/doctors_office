#Read, update, delete modules for ruby and postgresql

#read: pass in hash with table, column, selector
#delete_item: pass in hash with table, item_id
#update_item: pass in hash with table, item_id, parameters, values

def read(attributes)
  items = []
  table = attributes["table"]
  column = attributes["column"]
  selector = attributes["selector"]
  results = DB.exec("SELECT * FROM #{table} WHERE #{column} = #{selector};")
  results.each do |result|
    items << self.new(result)
  end
  items
end

def delete_item(attributes)
  item_id = attributes["item_id"]
  table = attributes["table"]
  puts table
  puts item_id
  DB.exec("DELETE FROM #{table} WHERE id = #{item_id};")
end

def update_item(attributes)
  item_id = attributes["item_id"]
  table = attributes["table"]
  parameters = attributes["parameters"]
  values = attributes["values"]
  DB.exec("UPDATE #{table}
          SET (#{parameters}) = ('#{values}')
          WHERE id= #{item_id};")
end
