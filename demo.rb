# First Step
class Base
  class << self
    @@validators = []
    def validates(attr_name)
      @@validators << attr_name
    end

    def validators
      @@validators
    end
  end

  def valid?
    self.class.validators.each do |attr_name|
      value = send(attr_name)
      return false unless presence?(value)
    end
    true
  end

  def presence?(value)
    (value.respond_to?(:empty?) ? !value.empty? : !!value)
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