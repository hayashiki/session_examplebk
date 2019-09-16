require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "Post /login" do

    let!(:user) { create(:user, email: "user@example.com", password: "password") }
    let(:valid_attributes) { {email: "user@example.com", password: "password"} }
    let(:invalid_attributes) { {email: ''} }
    
    # リクエストするパラメータがただしいケース。
    # FactoryBot.attributes_forにするとhashにしてくれる
    context "valid params" do
      # 新しいセッションが作成されること、1増える
      it "create a new session" do
        post login_path, params: valid_attributes
        expect(session[:user_id]).to eq(User.last.id)  
      end

      # 正しくリダイレクトされること、この場合 users#showかな
      it 'redirects to the created user' do
        post login_path, params: valid_attributes
        expect(response).to redirect_to(tasks_path)
      end      
    end

    context "invalid params" do
      it "does not create a new session" do
        post login_path, params: valid_attributes
        expect(session[:user_id]).to eq(User.last.id)  
      end
    end
  end
end
