require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "Post /users" do

    let(:valid_attributes) { FactoryBot.attributes_for(:user) }
    let(:invalid_attributes) { {email: ''} }
    
    # リクエストするパラメータがただしいケース。
    # FactoryBot.attributes_forにするとhashにしてくれる
    context "valid params" do
      # 新しいレコードが作成されること、1増える
      it "create a new user" do
        expect {
          post users_path, params: { user: valid_attributes }
      }.to change(User, :count).by 1
      end

      # 正しくリダイレクトされること、この場合 users#showかな
      it 'redirects to the created user' do
        post users_path, params: { user: valid_attributes }
        expect(response).to redirect_to(User.last)
      end      
    end

    # 不正なパラメータ、このケースではemailがnil
    context "invalid params" do

      # 新しいレコードが作成されるないこと
      it 'does not create a Task' do
        expect {
          post users_path, params: { user: invalid_attributes }
        }.to_not change(User, :count)
      end
    end
  end
end
