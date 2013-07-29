class PasswordChecker
  def check(password)
    return false unless has_a_digit?(password)
    return false unless has_a_letter?(password)
    return false if long_enough?
    true
  end

private
  def has_a_digit?(password)
    password.match(/[0-9]/)
  end
  def has_a_letter?(password)
    password.match(/[a-zA-Z]/)
  end
  def long_enough?(password)
    password.length < 7
  end
end
