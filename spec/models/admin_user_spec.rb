require 'rails_helper'

RSpec.describe AdminUser, type: :model do

  describe "#name" do
    it "is the full name of the user" do
      user = build :admin_user, first_name: 'John', last_name: 'Doe'

      expect(user.name).to eq 'John Doe'
    end
  end

end
