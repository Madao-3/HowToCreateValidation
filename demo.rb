class Validator
  attr_accessor :attr_name

  def initialize(attr_name)
    @attr_name = attr_name
  end

  def valid?(obj)
    value = obj.send(@attr_name)
    (value.respond_to?(:empty?) ? !value.empty? : !!value)
  end
end

class Base
  class << self
    @@validators = []

    def validates(attr_names)
      attr_names.each do |attr_name|
        @@validators << Validator.new(attr_name)
      end
    end
    
    def validators
      @@validators
    end
  end


  def valid?
    self.class.validators.each do |validator|
      return false unless validator.valid?(self)
    end
    true
  end
end

class Post < Base
  attr_accessor :title, :content

  validates [:title, :content]

  def initialize(title, content)
    @title = title
    @content = content
  end
end
