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
        expect(song.name).to eq('ethical')
      end
      it 'artist_id' do
        expect(song.artist_id).to eq(1)
      end
      it 'artwork' do
        expect(song.artwork).to eq("https://placehold.it/50x50.jpg/000")
      end
    end # end field properties

    describe 'Includes these associations: ' do
      let(:song) {Song.first}
      it 'belongs to an artist' do
        expect(song.artist.name).to eq("$$money makin mitch$$")
      end
      it 'has many locations' do
        expect(song.locations.first.lat.class).to eq(Float)
      end
      it 'has many listens' do
        expect(song.listens.first.class).to eq(Listen)
      end
      it 'has many favorites' do
        expect(song.favorites.first.class).to eq(Favorite)
      end
      it 'has many comments' do
        # need to seed with comments for each song, comments.class returns a collection
        expect(song.comments.class).to eq(Comment::ActiveRecord_Associations_CollectionProxy)
      end
    end
  end # end Song model test
end
