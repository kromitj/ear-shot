require 'rails_helper'
require 'spec_helper'

RSpec.describe LandingsController, type: :controller do
  describe "'GET index' route: " do
    let(:user) {User.first}

    it "renders the user index template when no one is logged in instead of redirecting to user show" do
      get :index
      expect(response).to render_template('index')
    end
    it "redirects the user to their show page if their already logged in" do
      session[:user_id] = user.id
      get :index
      expect(response).to redirect_to(user)
    end
  end
end
