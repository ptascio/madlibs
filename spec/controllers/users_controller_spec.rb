require "rails_helper"

RSpec.describe UsersController, :type => :controller do

  describe "POST #create" do
    it "checks that password and confirm password match" do
      post :create, params: {:user=>{:password => "password"}, :confirm_password => "passwrrd"}
      expect(response).to redirect_to('/users/new')
    end

    it "checks that username is present" do
      post :create, params: {:user=>{:password => "password"}, :confirm_password => "password", :username => ""}
      expect(response).to redirect_to('/users/new')
    end

    it "checks that password length >= 6" do
      post :create, params: {:user=>{:password => "pass"}, :confirm_password => "pass", :username => "Todd"}
      expect(response).to redirect_to('/users/new')
    end

    it "creates a user" do
      post :create, params: {:user=>{:password => "password", :username => "Todd"}, :confirm_password => "password"}
      expect(response.status).to be(200)
    end

  end

  describe "DELETE destroy" do
    before do
      User.create!(username: "Todd", password: "toddster")
      Book.create!(title: "Todd's book", user_id: User.first.id)
      Book.create!(title: "Todd's 2nd book", user_id: User.first.id)
      Book.create!(title: "My book")
    end
    let(:user) { User.first }
    before { allow(controller).to receive(:current_user) { user } }
    it "finds the user and removes them from db" do
      expect{ delete :destroy, :id => 1}.to change(User, :count)
    end

    it "destroys user's books" do
      expect{ delete :destroy, :id => 1}.to change(Book, :count)
    end

    it "does not destroy other user's books" do
      delete :destroy, :id => 1
      expect(Book.count).to be(1)
    end

    it "redirects to root path" do
      delete :destroy, :id => 1
      expect(response).to redirect_to('/')
    end
  end

  describe "PATCH update" do
    let(:user) { User.create!(username: "Todd", password: "toddster") }
    before { allow(controller).to receive(:current_user) { user } }
    it "checks user password against current_user password" do
      patch :update, params: {id: 1, user:{:password => "toddddster", :username => "Toddd"}}
      expect(response).to redirect_to('/users/1')
    end

    it "changes current_user name" do
      patch :update, params: {id: 1, user:{:password => "toddster", :username => "The Todd"}}
      expect(User.first.username).to eq('The Todd')
    end

    it "requires username parameter" do
      expect{patch :update, params: {:id => 1, user:{:password => "toddster", :username => ""}}}.to_not change(user, :username)
    end
  end
end
