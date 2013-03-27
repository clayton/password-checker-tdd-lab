require 'rubygems'
require 'rspec'
require_relative 'checker'

describe 'Checker' do
  before(:each) do
    @sut = Checker.new
  end
  context "Regular User Password Strength" do
    before(:each) do
      @good_password = "abcabc6abc"
      @short_password = "abc"
    end
    it "should reject passwords that are less than 7 characters" do
      @sut.check(@short_password).should == false
    end
    it "should accept passwords that are greater than 6 characters" do
      @sut.check(@good_password).should == true
    end
    it "should reject passwords that don't have an alphanumeric character" do
      @sut.check("12345678").should == false
    end
    it "should reject password that don't have any number" do
      @sut.check("aaaaaaaaa").should == false
    end
  end
  context "Admin User Password Strength" do
    it "should reject passwords that are less than 10 characters" do
      @sut.check("abc123abc", true).should == false
    end
    it "should contain a special character" do
      @sut.check("abc123abc123", true).should == false
    end
  end
end
