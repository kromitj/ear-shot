require 'rails_helper'
require 'spec_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET show route: " do
    let(:me) {User.first}
    it "initiates a instance var named @user" do
      session[:user_id] = me.id
      get :show, :id => me.id
      expect(assigns(:user)).to eq(me)
    end
    it "renders the artist show template" do
      get :show, :id => me.id
      expect(response).to render_template("show")
    end
  end

  describe "POST create route: " do
    let(:me) {User.first}
    it "initiates a instance variable called @user" do
      session[:user_id] = me.id
      post :create, :user => { f_name: "Billy", l_name: "Bob", username: "billybob", email: "billybob@bill.com", password: "password", password_confirmation: "password"}
      expect(@user.class == User)
    end
    it "redirects to the newly created users show page" do
      post :create, :user => { f_name: "Billy", l_name: "Bob", username: "billybob", email: "billybob@bill.com", password: "password", password_confirmation: "password"}
      current_user = User.last
      expect(response).to redirect_to("/users/#{current_user.id}")
    end
    it "assigns full messages to instance var @errors when user info is not correct" do
       post :create, :user => { f_name: "Billy", l_name: "Bob", username: "billybob", email: "billybob@bill.com", password: "", password_confirmation: ""}
       expect(assigns(:errors)).to eq(["Password can't be blank"])
    end
    it "rerenders the new template when credentials are incomplete" do
       post :create, :user => { f_name: "Billy", l_name: "Bob", username: "billybob", email: "billybob@bill.com", password: "", password_confirmation: ""}
       expect(response).to render_template(:new)
    end
  end

  describe "GET new route: " do
    it "initiates a instance var named @user" do
      get :new
      expect(assigns(:user).class).to eq(User)
    end
    it "initiates a instance var named @user" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET edit route: " do
    let(:me) {User.first}
    it "initiates an instance var called @user equal to current user" do
      get :edit, :id => me.id
      expect(assigns(:user).id).to eq(me.id)
    end
    it "renders the _edit_user template" do
      get :edit, :id => me.id
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT update route: " do
    let(:me) {User.first}
    it "initiates an instance var called @user equal to current user" do
      post :update, :user => { f_name: "Billy", l_name: "Bob", username: "billybob"}, :id => me.id
      expect(assigns(:user).id).to eq(me.id)
    end
    it "redirects to to user#show" do
      post :update, :user => { f_name: "Billy", l_name: "Bob", username: "billybob"}, :id => me.id
      expect(response).to redirect_to("/users/#{me.id}")
    end
    it "rerenders users#edit if given invalid credentials" do
      post :update, :user => { f_name: "", l_name: "", username: ""}, :id => me.id
      expect(response).to render_template(:edit)
    end
  end
end
