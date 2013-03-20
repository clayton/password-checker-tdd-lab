class Checker
  def check(string)
    return false if string.length < 7
    return false unless string.match(/[a-z,A-Z]+/)
    return false unless string.match(/[0-9]+/)
    true
  end
end
