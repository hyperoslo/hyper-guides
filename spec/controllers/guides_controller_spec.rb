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

end
