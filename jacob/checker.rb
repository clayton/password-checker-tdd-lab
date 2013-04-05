class Checker
  attr_accessor :errors

  def check(password)
    self.errors = ["Password too short","Password doesn't contain a letter"]
    return false if password.length < 7
    self.errors[0] = ""
    return false if !password.match(/[a-zA-Z]/)
    self.errors[1] = ""
    return false if !password.match(/[0-9]/)
    true
  end
  def admin_check(password)
    return false unless check(password)
    return false if password.length <=10
    return false if !password.match(/[\W,_]/)
    true
  end
end
