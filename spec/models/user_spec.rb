require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  before(:all) do
    @valid_attributes = { 
      :email    => "user@example.com",
      :password => "password",
      :password_confirmation => "password"
    }
  end
  context "validations" do
    before(:each) do 
      @user = User.new
    end

    it "should require an email address" do
      @user.attributes = @valid_attributes.except(:email)
      @user.should_not be_valid
      @user.email = @valid_attributes[:email]
      @user.should be_valid
    end

    it "should require a password" do
      User.new(@valid_attributes.except(:password)).should_not be_valid
    end

    it "should require a password confirmation" do
      User.new(@valid_attributes.except(:password_confirmation)).should_not be_valid
    end
  end
end
