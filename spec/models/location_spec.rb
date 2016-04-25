require 'rails_helper'
require 'spec_helper'

RSpec.describe Location, type: :model do
  describe 'Model tests: ' do
    describe 'Includes these field properties: ' do
      let(:location) {Location.first}
      it 'queries a location object' do
        expect(location.class).to eq(Location)
      end
      it 'an id' do
        expect(location.id).to eq(1)
      end
      it 'a longitude' do
        expect(location.long.class).to eq(Float)
      end
      it 'an latitude' do
        expect(location.lat.class).to eq(Float)
      end
      it 'an id' do
        expect(location.radius.class).to eq(Float)
      end
      it 'an song_id' do
        expect(location.song_id.class).to eq(Fixnum)
      end
      it 'an experation' do
        expect(location.expiration.class).to eq(ActiveSupport::TimeWithZone)
      end
    end #

     describe 'Includes these associations: ' do
        let(:location) {Location.first}
        it 'belongs to a song' do
        expect(location.song.class).to eq(Song)
      end
     end # end associations tests
  end

end
