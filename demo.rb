require('./validator')
require('./validators/presence')
require('./validators/length')

class Base
  class << self
    @@validators = []

    def validates(*attributes)
      validators = extract_options!(attributes)
      validators.each do |validator, option|
        attributes.each do |attr_key|
          key = "#{validator.to_s}Validator"
          @@validators << Object.const_get(key).new(attr_key, option)
        end
      end
    end

    def extract_options!(attributes)
      if attributes.last.is_a?(Hash)
        attributes.pop
      else
        {}
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

  validates :title, :content, Presence: true
  validates :title, Length: { minimum: 3, maximum: 12 }

  def initialize(title, content)
    @title = title
    @content = content
  end
end
