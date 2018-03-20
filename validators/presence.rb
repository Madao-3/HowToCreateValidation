class PresenceValidator < Validator
  def valid?(obj)
    value = obj.send(@attr_name)
    result = (value.respond_to?(:empty?) ? !value.empty? : !!value)
    @option ? result : !result
  end
end