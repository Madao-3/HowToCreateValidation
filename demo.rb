class Vaildator
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

    def validates(attr_name)
      @@validators << Vaildator.new(attr_name)
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
  attr_accessor :title

  validates :title

  def initialize(title)
    @title = title
  end
end

blank_title_post = Post.new('')
blank_title_post.valid?