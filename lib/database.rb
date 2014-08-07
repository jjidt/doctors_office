class Database
  def self.delete(attributes)
    attributes["table"] = @table
    delete_item(attributes)
  end

  def self.update(attributes)
    attributes["table"] = @table
    update_item(attributes)
  end

  def self.all
    read({"table" => @table, "column" => "'*'", "selector" => "'*'"})
  end

  def self.find(column, value)
    read({"table" => @table, "column" => column, "selector" => "'#{value}'"})
  end
end
