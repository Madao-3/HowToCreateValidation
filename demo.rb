class Base
  class_attribute :validators

  class << self
    def validates(*attrs)
      
      
      
      validates ||= []
      validates << 
    end
  end

  def vaild?
    
  end
end

class Post < Base
  attr_accessor :name

  validates :name, presence: true

  def initialize(name)
    @name = name
  end
end

Post