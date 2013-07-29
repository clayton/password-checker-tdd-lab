class PasswordChecker
  def check(password)
    return false unless has_a_digit?(password)
    return false unless password.match(/[a-zA-Z]/)
    return false if password.length < 7
    true
  end

private
  def has_a_digit?(password)
    password.match(/[0-9]/)
  end
end
