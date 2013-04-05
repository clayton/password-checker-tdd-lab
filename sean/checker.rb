class Checker
  def check(password)
    if password.length < 7 || !password.match(/[a-zA-Z]/) || !password.match(/[0-9]/)
      return false
    end
    return true
  end

  def admin_check(password)
    if password.length < 10 || !password.match(/\W/)
      return false
    end
    return check(password)
  end
end
