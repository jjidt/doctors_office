class Database

  def initialize(db_name)
    db_check = DB.exec("SELECT datname FROM pg_database WHERE datistemplate = false;")
    db_results = []
    db_check.each { |i| db_results << i.values}
    if !db_results.include?([db_name])
      DB.exec("CREATE DATABASE #{db_name}")
      DB.exec("CREATE DATABASE #{db_name}_test")
    end
  end

  def create
      @accessors.each do |instance|
        instance_chop = instance.to_s.gsub(/@/, '')
        instance_eval("#{instance} = '#{@attributes[instance_chop]}'")
      end
  end

  def save
    table = @table
    keys = @attributes.keys.join(", ")
    values = @attributes.values.map do|value|
      "'" + value.to_s + "'"
      end
    values = values.join(", ")
    results = DB.exec("INSERT INTO #{table} (#{keys}) VALUES (#{values}) RETURNING id;")
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
