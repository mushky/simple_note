require 'rails_helper'

RSpec.describe NotesController, type: :controller do
	current_user = User.new(email: "test@test.com", password: "fake_password")
	describe "POST #create" do
		context "with valid attributes" do 
			it "creates new note" do
				post :create, current_user.notes.new(title:"Sample Title", description: "Sample Description")

				expect(Note.count).to eq(1)
			end
		end
	end
end
