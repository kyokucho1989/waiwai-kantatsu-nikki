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
    subject { post('/username/users' ,params: params) }
    let(:params){ {user: attributes_for(:user)} }

    it "ユーザーのレコードが作成できる" do
      # binding.pry
      expect{subject }.to change { User.count }.by(1)
      expect(response).to have_http_status(204)
    end
  end

  describe "PATCH /users/:id" do
    subject { patch(user_path(user.id) ,params: params) }
    let(:params) {{ user: { nickname: Faker::Name.name, created_at: Time.current } }}
    let(:user){create(:user)}
    it "任意のユーザーのレコードを更新できる" do
     
      expect { subject }.to change { User.find(user.id).nickname }.from(user.nickname).to(params[:user][:nickname]) &
                          not_change { User.find(user.id).email } &
                          not_change { User.find(user.id).created_at }
      expect(response).to have_http_status(204)
    end
  end

  describe "DELETE /users/:id" do
    subject { delete(user_path(user.id)) }
    let!(:user) { create(:user) }
    it "任意のユーザーのレコードを削除できる" do
      expect { subject }.to change {User.count}.by(-1)
      expect(response).to have_http_status(204)
    end
  end
end
