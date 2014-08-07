class Database
  def self.delete(attributes)
    @@delete_attributes = ["item_id"]
    attributes["table"] = @table
    delete_item(attributes)
  end

  def self.update(attributes)
    @@update_attributes = ["item_id", "parameters", "values"]
    attributes["table"] = @table
    update_item(attributes)
  end

  def self.all(*attributes)
    read({"table" => @table, "column" => "'*'", "selector" => "'*'"})
  end

  def self.find(attributes)
    attributes["table"] = @table
    read(attributes)
  end
end
