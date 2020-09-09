require 'rails_helper'

RSpec.describe User, type: :model do
  context "accountを指定しているとき" do
    it "ユーザーが作られる" do
      user = User.new(email: 'kyokucho@example.com', password: 'password',nickname: 'kyokucho')
      expect(user).to be_valid
    end
  end

  context "accountを指定していないとき" do
    it "エラーする" do
      user = User.new(email: 'kyokucho@example.com', password: nil,nickname: 'kyokucho')
      user.valid?
      expect(user.errors.messages[:password]).to include "can't be blank"
      # binding.pry
    end
  end

  context "同名のaccountが存在するとき" do
    it "エラーする" do
      User.create!(email: 'kyokucho@example.com', password: 'password',nickname: 'kyokucho')
      user = User.new(email: 'kyokucho@example.com', password: 'password',nickname: 'kyokucho')
      user.valid?
      # binding.pry
      expect(user.errors.messages[:email]).to include "has already been taken"
    end
  end
end
