class Checker
  attr_accessor :errors

  def initialize
    self.errors = []
  end

  def check(string, is_admin=false)
    if string.length < 7
      errors << "Your password is too short."
      return false
    end

    unless string.match(/[a-z,A-Z]+/)
      errors << "Your password must contain an alphanumeric character."
      return false
    end

    return false unless string.match(/[0-9]+/)
    if(is_admin)
      if string.length < 10
        errors << "Your password must contain at least 10 characters."
        return false
      end
      return false unless string.match(/[\W,_]+/)
    end
    true
  end
end
