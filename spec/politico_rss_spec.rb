require 'spec_helper'

describe PoliticoRSS do
  it 'has a version number' do
    expect(PoliticoRSS::VERSION).not_to be nil
  end

  describe "#feed" do
    let(:response){ PoliticoRSS.feed("playbook") }

    it 'returns a ruby hash containing feed contents and metadata' do
      expect(response).to be_a(Hash)

      expect(response[:title]).to be_a(String)
      expect(response[:description]).to be_a(String)
      expect(response[:link]).to be_a(String)
      expect(response[:language]).to be_a(String)
      expect(response[:copyright]).to be_a(String)
      expect(response[:pub_date]).to be_a(String)

      expect(response[:image]).to be_a(Hash)
      expect(response[:image][:title]).to be_a(String)
      expect(response[:image][:url]).to be_a(String)

      expect(response[:items]).to be_a(Array)
      expect(response[:items]).to_not be_empty
      expect(response[:items].first[:title]).to be_a(String)
      expect(response[:items].first[:link]).to be_a(String)
      expect(response[:items].first[:description]).to be_a(String)
      expect(response[:items].first[:pub_date]).to be_a(String)
      expect(response[:items].first[:guid]).to be_a(String)
    end
  end
end
