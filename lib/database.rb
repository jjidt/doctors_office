class Database

  def save
    keys = @attributes.keys.join(", ")
    values = @attributes.values.map do|value|
      "'" + value.to_s + "'"
      end
    values = values.join(", ")
    results = DB.exec("INSERT INTO doctors (#{keys}) VALUES (#{values}) RETURNING id;")
    @id = results.first['id'].to_i
  end

  def self.delete(attributes)
    attributes["table"] = @table
    delete_item(attributes)
  end

  def self.update(attributes)
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

def create(attributes, accessors)
    accessors.each do |instance|
      instance_chop = instance.to_s.gsub(/@/, '')
      instance_eval("#{instance} = '#{attributes[instance_chop]}'")
    end
end
