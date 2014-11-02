require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "POST create" do
    let(:email)    { 'user@example.org' }
    let(:password) { "secret-password" }

    let!(:user)    { create :admin_user, email: email, password: password }

    context "when valid credentials are passed in" do
      before do
        allow(user).to receive(:authenticate)
          .with(password).and_return true
      end

      it "creates a session for that user" do
        post :create, username: email, password: password
        expect(session[:user_id]).to eq user.id
      end

      it "returns http success" do
        expect(response).to have_http_status :success
      end
    end

    context "when the wrong username is passed in" do
      before { post :create, username: 'wrong-email-address', password: password }

      it "doesn't set the session" do
        expect(session[:user_id]).to be nil
      end

      it "returns http unprocessable entity" do
        expect(response).to have_http_status :unprocessable_entity
      end
    end

    context "when the right username and wrong password are passed in" do
      before { post :create, username: email, password: 'wrong-password' }

      it "doesn't set the session" do
        expect(session[:user_id]).to be nil
      end

      it "returns http unprocessable entity" do
        expect(response).to have_http_status :unprocessable_entity
      end
    end
  end

  describe "DELETE destroy" do
    before do
      session[:user_id] = 123
      delete :destroy
    end

    it "ensures the session is not set" do
      expect(session[:user_id]).to be_nil
    end

    it "returns http success" do
      expect(response).to have_http_status :success
    end
  end

end
