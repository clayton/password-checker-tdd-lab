require 'rubygems'
require 'rspec'
require_relative 'checker'

describe "Checker" do
  context "Regular User Passwords" do
    before(:each) do
      @sut = Checker.new
    end
    it "should reject passwords that are less than 7 characters" do
      @sut.check("abc").should == false
    end

    it "should reject passwords that dont have atleast 1 alphanumeric characters" do
      @sut.check("1277777777773").should == false
    end

    it "should reject passwords that don't have at least 1 digit" do
      @sut.check("PASSWORD").should == false
    end
    it "should not reject passwords that use 0 as the digit" do
      @sut.check("PASSWORD0").should == true
    end
  end
  context "Admin User Passwords" do
    before(:each) do
      @sut = Checker.new
    end
    it "should reject passwords that are less than 10 characters" do
       @sut.check("ABC123ABC", true).should == false
    end
    it "should reject passwords that don't contain at least 1 special character" do
       @sut.check("ABC123ABC123", true).should == false
    end
    it "should accept passwords that use an underscore as the special character" do
      @sut.check("ABC123ABC123_", true).should == true
    end
  end
  context "Feedback" do
    before(:each) do
      @sut = Checker.new
    end
    it "should tell us when our password is too short" do
      @sut.check("ABC")
      @sut.errors.include?("Your password is too short.").should == true
    end
    it "should tell us when our password doesn't have an alphanumeric character" do
      @sut.check("128381838183813")
      @sut.errors.include?("Your password must contain an alphanumeric character.").should == true
    end
    it "should tell admins that their password must be 10 characters" do
      @sut.check("ABC!12345", true)
      @sut.errors.include?("Your password must contain at least 10 characters.").should == true
    end
  end
end
