require 'rails_helper'

RSpec.describe GuidesController, type: :controller do

  let(:guide) { create :guide }

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status :success
    end
  end

  describe "GET show" do
    context "when the guide has been published" do
      let(:guide) { create :published_guide }

      before { get :show, id: guide.to_param }

      it "assigns the guide to @guide" do
        expect(assigns(:guide)).to eq guide
      end

      it "returns http success" do
        expect(response).to have_http_status :success
      end

      it "renders the 'show' template" do
        expect(response).to render_template :show
      end
    end

    context "when the guide is unpublished" do
      let(:guide) { create :unpublished_guide }

      context "when signed in" do
        let(:user) { create :admin_user }

        before do
          session[:user_id] = user.id
          get :show, id: guide.to_param
        end

        it "assigns the guide to @guide" do
          expect(assigns(:guide)).to eq guide
        end

        it "returns http success" do
          expect(response).to have_http_status :success
        end

        it "renders the 'show' template" do
          expect(response).to render_template :show
        end
      end

      context "when not signed in" do
        before { session[:user_id] = nil }

        it "raises an ActiveRecord::NotFound error" do
          expect { get :show, id: guide.to_param }
            .to raise_error ActiveRecord::RecordNotFound
        end
      end
    end
  end

  describe "GET new" do
    context "when signed in" do
      let(:user) { create :admin_user }

      before do
        session[:user_id] = user.id
        get :new
      end
      
      it "assigns a new guide to @guide" do
        expect(assigns(:guide)).to be_a_new Guide
      end
      
      it "renders the 'new' template" do
        expect(response).to render_template :new
      end
    end

    context "when not signed in" do
      before { session[:user_id] = nil }

      it "raises an ActiveRecord::NotFound error" do
        expect { get :new }.to raise_error CanCan::AccessDenied
      end
    end
  end

  describe "POST create" do
    def post_create
      post :create, guide: guide_attrs
    end

    context "when signed in" do
      let(:user) { create :admin_user }

      before { session[:user_id] = user.id }

      context "when given a valid set of attributes" do
        let(:guide_attrs) { attributes_for :guide }
      
        it "creates a new guide" do
          expect { post_create }.to change(Guide, :count).by 1
        end
      end
      
      context "when given an invalid set of attributes" do
        let(:guide_attrs) { { title: nil } } # invalid; title is required
      
        it "does not creates a new guide" do
          expect { post_create }.not_to change(Guide, :count)
        end
      end
    end

    context "when not signed in" do
      before { session[:user_id] = nil }

      let(:guide_attrs) { attributes_for :guide }

      it "raises an ActiveRecord::NotFound error" do
        expect { post_create }.to raise_error CanCan::AccessDenied
      end
    end
  end

  describe "GET edit" do
    context "when signed in" do
      let(:user) { create :admin_user }
      let(:guide) { create :guide }

      before do
        session[:user_id] = user.id
        get :edit, id: guide.to_param
      end

      it "assigns the guide to @guide" do
        expect(assigns(:guide)).to eq guide
      end

      it "renders the 'edit' template" do
        expect(response).to render_template :edit
      end
    end

    context "when not signed in" do
      before { session[:user_id] = nil }

      it "raises an ActiveRecord::NotFound error" do
        expect { get :edit, id: guide.to_param }.to raise_error CanCan::AccessDenied
      end
    end
  end

  describe "PUT update" do
    def put_update
      put :update, id: guide.id, guide: new_guide_attrs
    end

    context "when signed in" do
      let(:user) { create :admin_user }

      before do
        session[:user_id] = user.id
        put_update
        guide.reload
      end

      context "when given a valid set of attributes" do
        let(:new_guide_attrs) { { title: "New guide title" } }

        it "creates updates the guide" do
          expect(guide.title).to eq "New guide title"
        end
      end

      context "when given an invalid set of attributes" do
        let(:new_guide_attrs) { { title: nil } } # invalid; title is required

        it "does not update the guide" do
          expect(guide.title).not_to eq "New guide title"
        end
      end
    end

    context "when not signed in" do
      before { session[:user_id] = nil }

      let(:new_guide_attrs) { attributes_for :guide }

      it "raises an ActiveRecord::NotFound error" do
        expect { put_update }.to raise_error CanCan::AccessDenied
      end
    end
  end

  describe "DELETE destroy" do
    def delete_destroy
      delete :destroy, id: guide.to_param
    end

    before { guide.save! }

    context "when signed in" do
      let(:user) { create :admin_user }

      before { session[:user_id] = user.id }

      it "deletes the guide" do
        expect { delete_destroy }.to change(Guide, :count).by(-1)
      end
    end

    context "when not signed in" do
      before { session[:user_id] = nil }

      it "raises a CanCan::AccessDenied error" do
        expect { delete_destroy }.to raise_error CanCan::AccessDenied
      end
    end
  end

end
