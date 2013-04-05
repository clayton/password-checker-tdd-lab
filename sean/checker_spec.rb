require 'rubygems'
require 'rspec'
require_relative 'checker'

describe 'Checker' do
  before(:each) do
    @sut = Checker.new
  end
  context "All passwords" do
    it "should reject passwords that don't contain at least 1 letter" do
      @sut.admin_check("12345678901231313").should == false
    end
    it "should reject passwords that don't contain at least 1 digit" do
      @sut.admin_check("asjajfgajgjgabbccdd").should == false
    end
  end
  context "User Passwords" do
    it "should reject passwords that are less than 7 characters" do
      @sut.check("abc").should == false
    end
  end
  context "Admin Passwords" do
    it "should reject passwords that are less than 10 characters" do
      @sut.admin_check("abcabc123").should == false
    end
    it "should reject passwords that don't contain a special character" do
      @sut.admin_check("asn5jdd8v9dejaaaa").should == false
    end
  end
end
