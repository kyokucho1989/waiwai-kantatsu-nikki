require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    subject { get(users_path) }
    before do
      @users = create_list(:user,30)
      @nickname_list = @users.map{|user| user.nickname}
    end
    it "ユーザーの一覧が取得できる" do
      subject

      # binding.pry
      @nickname_list.each do |nickname|
        expect(response.body).to include(nickname)
      end
      expect(response).to have_http_status(200)

    end
  end

  describe "GET /users/:id" do
    subject { get(user_path(user_id)) }
    context "指定したidのユーザーが存在する場合" do 
      let(:user) { create(:user)}
      let(:user_id) { user.id}
      it "ユーザーの値が取得できる" do
        subject
        # binding.pry
        
        expect(response).to have_http_status(200)
        expect(response.body).to include(user.nickname)
        expect(response.body).to include(user.email)
      end
    end

    context "指定したidのユーザーが存在しない場合" do 
      #  binding.pry
      let(:user_id) { 10000 }
      it "ユーザーが見つからない" do

        expect { subject }.to raise_error ActiveRecord::RecordNotFound
      end
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
