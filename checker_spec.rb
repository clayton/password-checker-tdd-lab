require 'rubygems'
require 'rspec'
require_relative 'checker'

describe "Checker" do
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
