class Checker
  def check(password, is_admin=false)
    return false unless password.length >= 7
    return false unless password.match(/[a-zA-Z]/)
    return false unless password.match(/[0-9]/)
    if is_admin
      return false unless password.length >= 10
      return false unless password.match(/[\W|_]/)
    end
    true
  end
end
