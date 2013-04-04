require 'rubygems'
require 'rspec'
require_relative 'checker'

describe 'Checker' do
  context "User Password" do
    before(:each) do
      @sut = Checker.new
    end
    it "should reject passwords that are less than 7 characters" do
      @sut.check("abc").should == false
    end
    it "should accept passwords that are greater than 7 characters" do
      @sut.check("abca7bcabc").should == true
    end
    it "should reject passwords that don't contain at least 1 letter" do
      @sut.check("12345678").should == false
    end
    it "should reject passwords that don't contain at least 1 digit" do
      @sut.check("abcdefgh").should == false
    end
  end
  context "Admin Password" do
    before(:each) do
      @sut = Checker.new
    end
    it "should reject passwords that are less than 10 characters" do
      @sut.admin_check("abcabcabc").should == false
    end
    it "should reject passwords that don't contain at least 1 letter" do
      @sut.admin_check("12345678901").should == false
    end
    it "should reject passwords that don't contain at least 1 digit" do
      @sut.admin_check("abcdefghijklmnop").should == false
    end
    it "should reject passwords that don't contain at least 1 special character" do
      @sut.admin_check("abc1defghijklmnop").should == false
    end
  end
end
