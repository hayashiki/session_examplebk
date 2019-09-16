require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "Post /tasks" do

    let!(:user) { create(:user) }    
    let(:valid_attributes) { attributes_for(:task) }
    let(:invalid_attributes) { {name: ''} }

    context 'User Logged In' do
      before do
        post login_path, params: { email: user.email, password: "password" }
      end

      context 'with valid params' do  
        it "create a new user" do
          expect {
              post tasks_path, params: { task: valid_attributes }
          }.to change(Task, :count).by 1
        end
      end

      context 'with invalid params' do
        it "create a new user" do
          expect {
            post tasks_path, params: { task: invalid_attributes }
          }.to_not change(Task, :count)
        end
      end
    end

    context 'User Not Logged In' do
      context 'with valid params' do  
        it "create a new user" do
          expect {
              post tasks_path, params: { task: valid_attributes }
          }.to_not change(Task, :count)
        end
      end
    end
  end
end
