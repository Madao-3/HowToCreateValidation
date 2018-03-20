class AbsenceValidator < Validator
  def valid?(obj)
    result = obj.send(@attr_name).present?
    @option ? result : !result
  end
end