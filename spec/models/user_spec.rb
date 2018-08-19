require 'rails_helper'

RSpec.describe User, :type => :model do
	user = FactoryGirl.create(:user)

  it "has a valid factory" do
    expect(user).to be_valid
  end

  describe User do
		it { is_expected.to validate_presence_of(:email) }  
		it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
	end


end