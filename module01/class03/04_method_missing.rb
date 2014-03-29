require 'json'

class MyOpenStruct
  def initialize(base_attributes = {})
    @attributes = base_attributes
  end

  def method_missing(method_name, *args)
    attribute_name = method_name.to_s.gsub('=', '')

    if method_name.to_s.include?('=')
      @attributes[attribute_name] = args[0]
    else
      @attributes[attribute_name]
    end
  end

  def to_json
    JSON.generate(@attributes)
  end
end