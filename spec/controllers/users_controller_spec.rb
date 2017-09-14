require "rails_helper"

RSpec.describe UsersController, :type => :controller do
  describe "POST create" do


    it "checks that password and confirm password match" do
      put :create, params: {:user=>{:password => "password"}, :confirm_password => "passwrrd"}
      expect(response).to redirect_to('/users/show')
    end

    it "checks that username is present" do
      put :create, params: {:user=>{:password => "password"}, :confirm_password => "password", :username => ""}
      expect(response).to redirect_to('/users/new')
    end

    it "checks that password length >= 6" do
      put :create, params: {:user=>{:password => "pass"}, :confirm_password => "pass", :username => "Todd"}
      expect(response).to redirect_to('/users/new')
    end

    it "creates a user" do
      put :create, params: {:user=>{:password => "password", :username => "Todd"}, :confirm_password => "password"}
      expect(response.status).to be(200)
    end
  end
end
