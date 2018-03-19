class Vaildator
  attr_accessor :attr_name, :option

  def initialize(attr_name, option)
    @attr_name = attr_name
    @option = option
  end

  def valid?(obj)
    raise NotImplementedError, "需要补充这个实现哦."
  end
end