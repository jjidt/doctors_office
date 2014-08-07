#update: item id, database table, parameters to update, values for each parameter
#delete: item id

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
# {"item_id", "table", "parameters", "values"}
  item_id = attributes["item_id"]
  table = attributes["table"]
  parameters = attributes["parameters"]
  values = attributes["values"]
  DB.exec("UPDATE #{table}
           SET (#{parameters}) = ('#{values}')
           WHERE id= #{item_id};")
end
