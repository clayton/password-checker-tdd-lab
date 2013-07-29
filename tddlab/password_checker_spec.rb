require_relative 'password_checker'

describe "Password Checking" do
  before(:each) do
    @sut = PasswordChecker.new
  end
  it "should reject passwords less than 7 characters" do
    @sut.check("abcd").should == false
  end
  it "should accept passwords greater than 6 characters" do
    @sut.check("password5").should == true
  end
  it "should reject passwords that don't have at least 1 letter" do
    @sut.check("12345678").should == false
  end
  it "should accept passwords with at least one letter" do
    @sut.check("12345678a").should == true
  end
  it "should accept passwords with at least one capital letter" do
    @sut.check("12345678A").should == true
  end
  it "should reject passwords without a digit" do
    @sut.check("qwertyuioop").should == false
  end


end
