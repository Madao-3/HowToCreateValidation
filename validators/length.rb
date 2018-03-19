class LengthValidator < Vaildator
  CHECKS = {:is=>:==, :minimum=>:>=, :maximum=>:<=}

  def valid?(obj)
    value = obj.send(@attr_name)
    value_length = value.respond_to?(:length) ? value.length : value.to_s.length
    CHECKS.each do |key, check_key|
      @option.each do |option_key, option_value|
        next unless CHECKS[option_key]
        p "#{value_length},#{CHECKS[option_key]},#{option_value}"
        return false unless value_length.send(CHECKS[option_key], option_value)
      end
    end
    true
  end
end