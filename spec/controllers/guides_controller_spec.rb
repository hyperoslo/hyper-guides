require 'rails_helper'

RSpec.describe GuidesController, type: :controller do

  let(:guide) { create :guide }

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

      it "raises an ActiveRecord::NotFound error" do
        expect { get :show, id: guide.to_param }
          .to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

  describe "GET new" do
    before { get :new }

    it "assigns a new guide to @guide" do
      expect(assigns(:guide)).to be_a_new Guide
    end

    it "renders the 'new' template" do
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    def post_create
      post :create, guide: guide_attrs
    end

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

end