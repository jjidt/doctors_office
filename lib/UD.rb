#update: item id, database table, parameters to update, values for each parameter
#delete: item id

def delete_item(attributes)
  item_id = attributes["item_id"]
  table = attributes["table"]
  DB.exec("DELETE FROM #{table} WHERE id = #{item_id};")
end
