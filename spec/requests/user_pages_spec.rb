require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do 
    before { visit signup_path }

    it { should have_content("Sign Up") }
    it { should have_title(full_title("Sign Up")) }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",             with: "Alex"
        fill_in "Email",            with: "new_user@example.com"
        fill_in "Password",         with: "fucken"
        fill_in "Password confirmation", with: "fucken"
      end

      it "should create user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user)}
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end
end