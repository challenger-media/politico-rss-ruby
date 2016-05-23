require 'spec_helper'

describe PoliticoRSS do
  it 'has a version number' do
    expect(PoliticoRSS::VERSION).not_to be nil
  end

  describe "#feed" do
    let(:feed_names){
      [
        # Story Categories ...
        "politicopicks", "congress", "healthcare", "defense", "economy", "energy", "politics08", "rogersimon",

        # Tipsheets ...
        "playbook", "morningtech", "morningmoney", "politicopulse", "huddle", "morningenergy", "morningdefense",
        "politicoinfluence", "morningscore", "morningtransportation", "morningeducation", "morningtax",
        "morningagriculture", "morningcybersecurity", "morningehealth", "morningshift", "morningtrade",

        # Blog ...
        "onmedia", "joescarborough_full", "undertheradar_full",

        # Magazine ...
        "whatworks"
      ]
    }

    it 'returns a ruby hash containing feed contents and metadata' do
      feed_names.each do |feed_name|
        puts "TESTING FEED -- #{feed_name} ..."

        feed = PoliticoRSS.feed(feed_name)
        pub_date = feed[:pub_date] || feed[:last_build_date] # the "onmedia" feed uses "lastBuildDate" instead of "pubDate" attribute

        expect(feed).to be_a(Hash)

        expect(feed[:title]).to be_a(String)
        expect(feed[:description]).to be_a(String)
        expect(feed[:link]).to be_a(String)
        expect(feed[:language]).to be_a(String)
        expect(feed[:copyright]).to be_a(String)
        expect(pub_date).to be_a(String)

        # not all feeds have an "image"...
        #expect(feed[:image]).to be_a(Hash)
        #expect(feed[:image][:title]).to be_a(String)
        #expect(feed[:image][:url]).to be_a(String)

        expect(feed[:items]).to be_a(Array)
        expect(feed[:items]).to_not be_empty
        expect(feed[:items].first[:title]).to be_a(String)
        expect(feed[:items].first[:link]).to be_a(String)
        #expect(feed[:items].first[:description]).to be_a(String) # not all items have a "description"
        #expect(feed[:items].first[:pub_date]).to be_a(String) # not all items have a "pub_date"
        expect(feed[:items].first[:guid]).to be_a(String)
      end
    end
  end
end
