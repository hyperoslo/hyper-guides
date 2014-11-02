require 'rails_helper'
require 'cancan/matchers'

RSpec.describe "A user" do
  subject(:ability) { Ability.new user }

  context "when a regular user" do
    let(:user) { nil }

    it "can read published guides" do
      guide = create :published_guide
      expect(subject).to be_able_to :read, guide
    end

    it "cannot read unpublished guides" do
      guide = create :unpublished_guide
      expect(subject).not_to be_able_to :read, guide
    end

    it "cannot create guides" do
      expect(subject).not_to be_able_to :create, Guide
    end

    it "cannot edit guides" do
      expect(subject).not_to be_able_to :edit, Guide
    end

    it "cannot destroy guides" do
      expect(subject).not_to be_able_to :destroy, Guide
    end
  end

  context "when an admin" do
    let(:user) { build :admin_user }

    it "can manange everything" do
      expect(subject).to be_able_to :manage, :all
    end
  end
end
