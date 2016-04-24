require 'rails_helper'
require 'spec_helper'
RSpec.describe Song, type: :model do

  describe 'Model tests: ' do
    describe 'Includes these field properties: ' do
      let(:song) {Song.first}
      it 'queries a song object' do
        expect(song.class).to eq(Song)
      end
      it 'an id' do
        expect(song.id).to eq(1)
      end
      it 'a name' do
        expect(song.name.class).to eq(String)
      end
      it 'artist_id' do
        expect(song.artist_id.class).to eq(Fixnum)
      end
      it 'artwork' do
        expect(song.artwork).to match(/\A(https:)/)
      end
    end # end field properties

    describe 'Includes these associations: ' do
      let(:song) {Song.first}
      it 'belongs to an artist' do
        expect(song.artist.class).to eq(Artist)
      end
      it 'has many locations' do
        expect(song.locations.first.lat.class).to eq(Float)
      end
      it 'has many listens' do
        expect(song.listens.first.class).to eq(Listen)
      end
      it 'has many favorites' do
        # seed data didn't crate any favorites for the song so it returns an empty collection
        expect(song.favorites.class).to eq(Favorite::ActiveRecord_Associations_CollectionProxy)
      end
      it 'has many comments' do
        # need to seed with comments for each song, comments.class returns a collection
        expect(song.comments.class).to eq(Comment::ActiveRecord_Associations_CollectionProxy)
      end
    end
  end # end Song model test
end
