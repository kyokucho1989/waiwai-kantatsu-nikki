require 'rails_helper'

RSpec.describe User, type: :model do
  context "accountを指定しているとき" do
    it "ユーザーが作られる" do
      user = build(:user)
      expect(user).to be_valid
      # binding.pry
    end
  end

  context "accountを指定していないとき" do
    it "エラーする" do
      user = build(:user,password: nil)
      user.valid?
      expect(user.errors.messages[:password]).to include "can't be blank"
      # binding.pry
    end
  end

  context "同名のaccountが存在するとき" do
    it "エラーする" do
      create(:user,email:'kyokucho@example.com')
      user = build(:user,email:'kyokucho@example.com')
      user.valid?
      # binding.pry
      expect(user.errors.messages[:email]).to include "has already been taken"
    end
  end
end
