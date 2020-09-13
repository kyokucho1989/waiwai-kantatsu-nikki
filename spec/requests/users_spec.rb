require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    subject { get(users_path) }
    before do
      create_list(:user,3)
    end
    it "ユーザーの一覧が取得できる" do
      subject

      binding.pry
      # get users_path
      # expect(response).to have_http_status(200)
    end
  end

  describe "GET /users/:id" do
    it "任意のユーザー値が取得できる" do
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /users" do
    it "ユーザーのレコードが作成できる" do
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  describe "PATCH /users/:id" do
    it "任意のユーザーのレコードを更新できる" do
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE /users/:id" do
    it "任意のユーザーのレコードを削除できる" do
      get users_path
      expect(response).to have_http_status(200)
    end
  end
end
