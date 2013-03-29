require 'rubygems'
require 'rspec'
require_relative 'checker'

describe "Checker" do
  context "User Password" do
    before(:each) do
      @sut = Checker.new
    end
    it "should reject passwords that are less than 7 characters" do
      @sut.check("abc").should == false
    end
    it "should accept passwords that are greater than 7 characters" do
      @sut.check("abcabcabc1").should == true
    end
    it "should reject passwords that don't have at least one letter" do
      @sut.check("1234567890").should == false
    end
    it "should reject passwords that don't have at least one digit" do
      @sut.check("ABCABCABC").should == false
    end
  end
  context "Admin Password" do
    before(:each) do
      @sut = Checker.new
    end
    it "should reject passwords that are less than 10 characters" do
      @sut.check_admin("abcabcab1").should == false
    end
    it "should reject passwords that don't have at least one letter" do
      @sut.check_admin("123456789908272").should == false
    end
  end
end
