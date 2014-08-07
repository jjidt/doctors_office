#update: item id, database table, parameters to update, values for each parameter
#delete: item id

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
