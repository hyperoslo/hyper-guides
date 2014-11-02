require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do

  describe "#current_user" do
    let!(:user) { create :admin_user }

    context "when signed in" do
      it "returns the currently signed in user" do
        session[:user_id] = user.id

        expect(subject.current_user).to eq user
      end
    end

    context "when not signed in" do
      it "returns nil" do
        session[:user_id] = nil

        expect(subject.current_user).to be_nil
      end
    end
  end

end
