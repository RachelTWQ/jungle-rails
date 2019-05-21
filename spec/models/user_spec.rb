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
      user1 = User.new(
        first_name: "xxx",
        last_name: "ooo",
        email: "a@a.com",
        password: "password",
        password_confirmation: "password"
      )
      user2 = User.new(
        first_name: "ooo",
        last_name: "xxx",
        email: "A@a.com",
        password: "12345678",
        password_confirmation: "12345678"
      )
      user1.save
      user2.save
      expect(user1).to be_valid
      expect(user2).to_not be_valid
      expect(user2.errors.messages[:email]).to include("has already been taken")
    end

    it "should not create a new user when password and password_confirmation doesn't match" do
      user1 = User.new(
        first_name: "xxx",
        last_name: "ooo",
        email: "s@s.com",
        password: "password",
        password_confirmation: "password"
      )
      user2 = User.new(
        first_name: "xxx",
        last_name: "ooo",
        email: "s@s.com",
        password: "password",
        password_confirmation: "passwor"
      )
      expect(user1).to be_valid
      expect(user2).to_not be_valid
      expect(user2.password).to eq(user2.password_confirmation)
      expect(user2.password).to_not eq(user2.password_confirmation)
    end

    it "should not create a new user when password length is shorter than 3" do
      user1 = User.new(
        first_name: "xxx",
        last_name: "ooo",
        email: "s@s.com",
        password: "password",
        password_confirmation: "password"
      )
      user2 = User.new(
        first_name: "xxx",
        last_name: "ooo",
        email: "1@1.com",
        password: "pa",
        password_confirmation: "pa"
      )
      user1.save
      user2.save
      expect(user1).to be_valid
      expect(user2).to_not be_valid
      expect(user2.errors.messages[:password]).to include("is too short (minimum is 3 characters)")
      expect(user2.errors.messages[:password_confirmation]).to include("is too short (minimum is 3 characters)")
    end

  end

end
