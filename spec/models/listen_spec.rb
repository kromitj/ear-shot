# https://www.relishapp.com/rspec/rspec-rails/docs/generators

require 'rails_helper'
require 'spec_helper'

RSpec.describe Listen, type: :model do
  describe 'Model tests: ' do
    describe 'Includes these field properties: ' do
      let(:listen) {Listen.first}
      it 'queries a listen object' do
        expect(listen.class).to eq(Listen)
      end
      it 'an id' do
        expect(listen.id).to eq(1)
      end
      it 'a song id' do
        expect(listen.song_id.class).to eq(Fixnum)
      end
      it 'a latitude' do
        expect(listen.lat.class).to eq(Float)
      end
    end
    describe 'Includes these associations: ' do
      let(:listen) {Listen.first}
      it 'belongs to a user' do
        expect(listen.user.class).to eq(User)
      end
      it 'belongs to a song' do
        expect(listen.song.class).to eq(Song)
      end
    end
  end
end
