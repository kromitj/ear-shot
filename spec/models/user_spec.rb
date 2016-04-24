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
        expect(user.profile_picture).to eq("https://robohash.org/my-own-slug.png?size=300x300&set=set1")
      end
    end # end user field props

    describe 'has these assosiations'
      let(:user) {User.first}
      it 'has many listens' do
        expect(user.listens.count).to eq(20)
      end
      it 'has many artists' do
        expect(user.artists.first.name).to eq("$$money makin mitch$$")
      end
      it 'has many comments' do
        expect(user.comments.first.content).to eq("Migas tacos flannel pickled gentrify bicycle rights sartorial.")
      end
      it 'has many favorites' do
        expect(user.favorites.first.song.name).to eq("pixel")
      end
    end

end # end model tests
