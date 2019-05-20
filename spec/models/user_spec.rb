require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do

    it "should create a new user" do
      user = User.new(
        first_name: "xxx",
        last_name: "ooo",
        email: "s@s.com",
        password: "password",
        password_confirmation: "password"
      )
      expect(user).to be_valid
    end

    it "should not create a new user when first_name is blank" do
      user = User.new(
        first_name: nil,
        last_name: "ooo",
        email: "s@s.com",
        password: "password",
        password_confirmation: "password"
      )
      expect(user).to_not be_valid
      expect(user.errors.messages[:first_name]).to include("can\'t be blank")
    end

    it "should not create a new user when last_name is blank" do
      user = User.new(
        first_name: "xxx",
        last_name: nil,
        email: "s@s.com",
        password: "password",
        password_confirmation: "password"
      )
      expect(user).to_not be_valid
      expect(user.errors.messages[:last_name]).to include("can\'t be blank")
    end

    it "should not create a new user when email is blank" do
      user = User.new(
        first_name: "xxx",
        last_name: "ooo",
        email: nil,
        password: "password",
        password_confirmation: "password"
      )
      expect(user).to_not be_valid
      expect(user.errors.messages[:email]).to include("can\'t be blank")
    end

    it "should not create a new user with repeated email" do
      user = User.new(
        first_name: "xxx",
        last_name: "ooo",
        email: "A@a.com",
        password: "password",
        password_confirmation: "password"
      )
      expect(user).to_not be_valid
      expect(user.errors.messages[:email]).to include("Email has already been taken")
    end

    it "should not create a new user when password and password_confirmation doesn't match" do
      user = User.new(
        first_name: "xxx",
        last_name: "ooo",
        email: "s@s.com",
        password: "password",
        password_confirmation: "passwor"
      )
      expect(user).to_not be_valid
      expect(user.errors.messages[:first_name]).to include("Password confirmation doesn\'t match Password")
    end

    it "should not create a new user when password length is shorter than 3" do
      user = User.new(
        first_name: "xxx",
        last_name: "ooo",
        email: "s@s.com",
        password: "pa",
        password_confirmation: "pa"
      )
      expect(user).to_not be_valid
      expect(user.errors.messages[:first_name]).to include("too short")
    end

  end

end
