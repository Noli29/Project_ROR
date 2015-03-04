require 'rails_helper'

RSpec.describe UsersController, :type => :controller do


  describe "POST create" do

    context "on successful save" do

      before do
        @user = double(User)
        @user.stub(:save).and_return(true)

        User.stub(:new) { @user }

        @mailer = double(UserMailer)

        ReferralConnector.stub(:execute)
        NewsletterSignupService.stub(:execute)
      end

    end
  end

  describe "index" do
    before do
      sign_in FactoryGirl.create(:user)
      FactoryGirl.create(:user, name: "Bob", email: "bob@example.com")
      FactoryGirl.create(:user, name: "Ben", email: "ben@example.com")
      visit users_path
    end
  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end
    end
  end

end
