class Checker
  def check(password)
    return false unless password.length > 7
    return false unless password.match(/[a-z,A-Z]/)
    return false unless password.match(/[0-9]/)
    true
  end
   def admin_check(password)
    return false unless check(password)
    return false unless password.length > 10
    return false unless password.match(/\W/)
    true
  end

end
