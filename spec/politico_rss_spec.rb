require 'spec_helper'

describe PoliticoRSS do
  it 'has a version number' do
    expect(PoliticoRSS::VERSION).not_to be nil
  end

  describe "#feed" do
    let(:feed){ PoliticoRSS.feed("playbook") }

    it 'returns a ruby hash containing feed contents and metadata' do
      expect(feed).to be_a(Hash)

      expect(feed[:title]).to be_a(String)
      expect(feed[:description]).to be_a(String)
      expect(feed[:link]).to be_a(String)
      expect(feed[:language]).to be_a(String)
      expect(feed[:copyright]).to be_a(String)
      expect(feed[:pub_date]).to be_a(String)

      expect(feed[:image]).to be_a(Hash)
      expect(feed[:image][:title]).to be_a(String)
      expect(feed[:image][:url]).to be_a(String)

      expect(feed[:items]).to be_a(Array)
      expect(feed[:items]).to_not be_empty
      expect(feed[:items].first[:title]).to be_a(String)
      expect(feed[:items].first[:link]).to be_a(String)
      expect(feed[:items].first[:description]).to be_a(String)
      expect(feed[:items].first[:pub_date]).to be_a(String)
      expect(feed[:items].first[:guid]).to be_a(String)
    end
  end
end
