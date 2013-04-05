require 'rubygems'
require 'rspec'
require_relative 'checker'

describe 'Checker' do
  before(:each) do
    @sut = Checker.new
  end
  context "All Password" do
    it "should reject passwords that do not contain a letter" do
      @sut.admin_check("12837198739734567").should == false
    end
    it "should reject passwords that do not contain a digit" do
      @sut.admin_check("abcabcabcabc").should == false
    end
  end
  context "User Passwords" do
    it "should reject passwords that are less than 7 characters" do
      @sut.check("abc").should == false
    end
  end
  context "Admin Passwords" do
    it "should reject passwords that are less than 10 characters" do
      @sut.admin_check("abcabcabc").should == false
    end
    it "should reject passwords that do not contain a special character" do
      @sut.admin_check("abcabcabc123").should == false
    end
    it "should accept passwords containing an underscore" do
      @sut.admin_check("abcabcabc123_").should == true
    end
  end
  context "Error Messaging" do
    it "should tell me why my password is bad" do
      @sut.check("abc")
      @sut.errors.include?("Password too short").should == true
    end

  end
end
