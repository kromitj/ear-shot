require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do

  describe 'Model tests: ' do
    describe 'Includes these field properties: ' do
      let(:user) {User.first}
      it 'a first name' do
        expect(user.f_name).to eq("Mitch")
      end
      it 'a last name' do
        expect(user.l_name).to eq("Kroska")
      end
      it 'a username' do
        expect(user.username).to eq("kromitj")
      end
      it 'an email' do
        expect(user.email).to eq("krosksam8457@hotmail.com")
      end
      it 'a password_digest' do
        expect(user.password_digest.class).to eq(String)
      end
      it 'password_digest is actually encrypted' do
        expect(user.password_digest).to_not eq("password")
      end
      it 'a profile picture field' do
        expect(user.profile_picture).to match(/\A(https:)/)
      end
    end # end user field props

    describe 'has these assosiations: ' do
      let(:user) {User.first}
      it 'has many listens' do
        expect(user.listens.first.class).to eq(Listen)
      end
      it 'has many artists' do
        expect(user.artists.first.class).to eq(Artist)
      end
      it 'has many comments' do
        expect(user.comments.first.class).to eq(Comment)
      end
      it 'has many favorites' do
        expect(user.favorites.first.class).to eq(Favorite)
      end
    end
  end
end # end model tests
