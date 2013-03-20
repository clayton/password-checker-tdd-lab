class Checker
  def check(string, is_admin=false)
    return false if string.length < 7
    return false unless string.match(/[a-z,A-Z]+/)
    return false unless string.match(/[0-9]+/)
    if(is_admin)
      return false if string.length < 10
      return false unless string.match(/[\W,_]+/)
    end
    true
  end
end
