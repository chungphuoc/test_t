require 'rails_helper'

RSpec.describe StudioStationService, type: :service do
  let(:studio) { create(:studio) }
  let(:user) { create(:user, role: studio) }
  let(:station_1) { create(:station) }
  let(:station_2) { create(:station) }
  let(:station_3) { create(:station) }

  context 'Studio add new stations to its stations list' do
    before { StudioStationService.new(studio).update_stations([station_1.id]) }
    it { expect(studio.stations.pluck(:id)).to eq([station_1.id]) }
  end

  context 'Studio remove old stations from its stations list' do
    before do
      studio_station_service = StudioStationService.new(studio)
      studio_station_service.update_stations([station_1.id, station_2.id])
      studio_station_service.update_stations([station_2.id])
    end
    it { expect(studio.stations.pluck(:id)).to eq([station_2.id]) }
  end

  context 'Studio add new stations to and remove old stations from its stations list' do
    before do
      studio_station_service = StudioStationService.new(studio)
      studio_station_service.update_stations([station_1.id, station_2.id])
      studio_station_service.update_stations([station_2.id, station_3.id])
    end
    it { expect(studio.stations.pluck(:id)).to eq([station_2.id, station_3.id]) }
  end
end
